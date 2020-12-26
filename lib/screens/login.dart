import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:insideapp/globals.dart';
import 'package:insideapp/screens/main_screen.dart';
import 'package:insideapp/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget {
  String message;
  LoginScreen(
      {Key key,
        this.message})
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _nameControl = new TextEditingController();
  final TextEditingController _mobileControl = new TextEditingController();
  bool isLoading = false;
  bool mobileRequired = false;
  bool nameRequired = false;
  bool mobileInUse = false;
  bool deactivatedAccount = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      // demo of some additional parameters
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[

            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 25.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Use a valid phone number.",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  widget.message != null
                      ? Text(
                          "${widget.message}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        )
                      : SizedBox(),
                  deactivatedAccount
                      ? Text(
                          "You account has been deactivated by admins",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),

            SizedBox(height: 30.0),

            Card(
              elevation: 3.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  onChanged: (text){
                    mobileRequired = false;
                    mobileInUse = false;
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _mobileControl,
                ),
              ),
            ),
            mobileRequired ? Text('Mobile is required.', style: TextStyle(color: Colors.red),):SizedBox(),
            mobileInUse ? Text('Mobile already in use.', style: TextStyle(color: Colors.red),):SizedBox(),
            SizedBox(height: 10.0),
            Card(
              elevation: 3.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  onChanged: (text){
                    nameRequired = false;
                    setState(() {});
                  },
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _nameControl,
                ),
              ),
            ),
            nameRequired ? Text('Name is required.', style: TextStyle(color: Colors.red),):SizedBox(),

            SizedBox(height: 10.0),



            Container(
              height: 50.0,
              child: RaisedButton(
                child: Text(
                  "LOGIN".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (Globals().isDemo) {
                    await SharedPreferences.getInstance().then((prefs) {
                      prefs.setString('mode', 'client');
                      prefs.setString('userName', 'Demo User');
                      prefs.setString('userMobile', '01111111111');
                      isLoading = false;
                      setState(() {});
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MainScreen();
                          },
                        ),
                      );
                    });
                  } else {
                    FocusScope.of(context).unfocus();
                    if (_mobileControl.text == "") {
                      mobileRequired = true;
                      setState(() {});
                    } else if (_nameControl.text == "") {
                      nameRequired = true;
                      setState(() {});
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthService(name:_nameControl.text,mobile:_mobileControl.text).doRegister().then((res) async {
                        if (res['mobile'][0] == 'client with this mobile already exists.'){
                          await AuthService().doLogin().then((users) async {
                            for (var singleUser in users){
                              print(singleUser['mobile']);
                              if (singleUser['mobile'] == _mobileControl.text) {
                                if (singleUser['is_active'] == false) {
                                  deactivatedAccount = true;
                                  isLoading = false;
                                  setState(() {});
                                } else {
                                  await SharedPreferences.getInstance().then((
                                      prefs) {
                                    prefs.setString('mode', 'client');
                                    prefs.setString(
                                        'userName', singleUser['name']);
                                    prefs.setString(
                                        'userMobile', singleUser['mobile']);
                                    isLoading = false;
                                    setState(() {});
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return MainScreen();
                                        },
                                      ),
                                    );
                                  });
                                }
                              }
                            }
                          });
                        } else {
                          print(res['is_active']);
                          if (res['is_active'] == 'false') {
                            deactivatedAccount = true;
                            isLoading = false;
                            setState(() {});
                          } else {
                            await SharedPreferences.getInstance().then((prefs) {
                              prefs.setString('mode', 'client');
                              prefs.setString('userName', res['name']);
                              prefs.setString('userMobile', res['mobile']);
                              isLoading = false;
                              setState(() {});
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return MainScreen();
                                  },
                                ),
                              );
                            });
                          }
                        }
                      });
                    }
                  }
                },
                color: Theme.of(context).accentColor,
              ),
            ),

            SizedBox(height: 10.0),
            Divider(color: Theme.of(context).accentColor,),
            SizedBox(height: 10.0),


//          Center(
//            child: Container(
//              width: MediaQuery.of(context).size.width/2,
//              child: Row(
//                children: <Widget>[
//                  RawMaterialButton(
//                    onPressed: (){},
//                    fillColor: Colors.blue[800],
//                    shape: CircleBorder(),
//                    elevation: 4.0,
//                    child: Padding(
//                      padding: EdgeInsets.all(15),
//                      child: Icon(
//                        FontAwesomeIcons.facebookF,
//                        color: Colors.white,
////              size: 24.0,
//                      ),
//                    ),
//                  ),
//
//                  RawMaterialButton(
//                    onPressed: (){},
//                    fillColor: Colors.white,
//                    shape: CircleBorder(),
//                    elevation: 4.0,
//                    child: Padding(
//                      padding: EdgeInsets.all(15),
//                      child: Icon(
//                        FontAwesomeIcons.google,
//                        color: Colors.blue[800],
////              size: 24.0,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),

            SizedBox(height: 20.0),

          ],
        ),
      ),
    );
  }
}
