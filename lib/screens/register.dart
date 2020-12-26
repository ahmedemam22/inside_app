import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:insideapp/globals.dart';
import 'package:insideapp/screens/supplier_home.dart';
import 'package:insideapp/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameControl = new TextEditingController();
  final TextEditingController _mobileControl = new TextEditingController();
  final TextEditingController _passwordControl = new TextEditingController();
  bool mobileInUse = false;
  bool mobileRequired = false;
  bool nameRequired = false;
  bool passwordRequired = false;
  bool isLoading = false;
  bool notActive = false;
  bool isCreated = false;

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
                  Column(
                    children: [
                      Text(
                        "Use application as a supplier",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Theme
                              .of(context)
                              .accentColor,
                        ),
                      ),
                      SizedBox(height: 10,),
                      isCreated ? Text(
                        "Account has been created. \n we will contact you  to activate it as soon as possible ",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent,
                        ),
                      ) : SizedBox(),
                    ],
                  ),
                  SizedBox(height: 10,),
                  notActive ? Text(
                    "Account is not active",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ) : SizedBox(),
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
                    mobileInUse = false;
                    mobileRequired = false;
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
                    hintText: "Mobile",
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _mobileControl,
                ),
              ),
            ),
            mobileInUse ? Text('Mobile already in use', style: TextStyle(color: Colors.red),):SizedBox(),
            mobileRequired ? Text('Mobile is required', style: TextStyle(color: Colors.red),):SizedBox(),
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
                    passwordRequired = false;
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
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _passwordControl,
                  obscureText: true,
                ),
              ),
            ),
            passwordRequired
                ? Text(
              'Password is required', style: TextStyle(color: Colors.red),)
                : SizedBox(),
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
                  onChanged: (text) {
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
                    hintText: "Full Name",
                    prefixIcon: Icon(
                      Icons.perm_identity,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _usernameControl,
                ),
              ),
            ),
            nameRequired
                ? Text('Name is required', style: TextStyle(color: Colors.red),)
                : SizedBox(),
            SizedBox(height: 10.0),


            SizedBox(height: 40.0),

            Container(
              height: 50.0,
              child: RaisedButton(
                child: Text(
                  "Join as supplier".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (Globals().isDemo) {
                    await SharedPreferences.getInstance().then((prefs) {
                      prefs.setString('mode', 'supplier');
                      prefs.setString('supplierName', "demo supplier");
                      prefs.setString('supplierMobile', "01111111111");
                      isLoading = false;
                      setState(() {});
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SupplierHome();
                          },
                        ),
                      );
                    });
                  } else {
                    isLoading = true;
                    setState(() {});
                    if (_mobileControl.text == "") {
                      mobileRequired = true;
                      setState(() {});
                    } else if (_passwordControl.text == "") {
                      passwordRequired = true;
                      setState(() {});
                    } else if (_usernameControl.text == "") {
                      nameRequired = true;
                      setState(() {});
                    } else {
                      await AuthService(
                              name: _usernameControl.text,
                              password: _passwordControl.text,
                              mobile: _mobileControl.text)
                          .supplierJoin()
                          .then((response) async {
                        if (response['mobile'][0] ==
                            'supplier with this mobile already exists.') {
                          await AuthService()
                              .doSupplierLogin()
                              .then((suppliers) async {
                            for (var singleSupplier in suppliers) {
                              if (singleSupplier['mobile'] ==
                                      _mobileControl.text &&
                                  singleSupplier['password'] ==
                                      _passwordControl.text) {
                                if (singleSupplier['is_active'] == false) {
                                  notActive = true;
                                  isLoading = false;
                                  setState(() {});
                                } else {
                                  await SharedPreferences.getInstance()
                                      .then((prefs) {
                                    prefs.setString('mode', 'supplier');
                                    prefs.setString(
                                        'supplierName', singleSupplier['name']);
                                    prefs.setString('supplierMobile',
                                        singleSupplier['mobile']);
                                    isLoading = false;
                                    setState(() {});
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return SupplierHome();
                                        },
                                      ),
                                    );
                                  });
                                }
                              }
                            }
                          });
                        } else {
                          isLoading = false;
                          isCreated = true;
                          setState(() {});
                          Future.delayed(Duration(seconds: 6), () {
                            setState(() {
                              isCreated = false;
                            });
                          });
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



            SizedBox(height: 20.0),


          ],
        ),
      ),
    );
  }
}
