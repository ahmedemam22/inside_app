import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:insideapp/screens/auth_screens/register.dart';
import 'package:insideapp/widgets/auth_fields.dart';
import 'package:insideapp/providers/login_provider.dart';
import 'package:insideapp/util/validation.dart';
import 'package:provider/provider.dart';

import 'package:insideapp/widgets/link_text.dart';
import 'package:insideapp/widgets/round_button.dart';

import '../home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSupplier = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_back_ground.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.7),
          ),
          Center(
            child: Column(
              children: [
                Hero(
                    tag: "main_logo",
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                      child: Image.asset(
                        'assets/logo/logo.png',
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login to your account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeIn(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.easeIn,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isSupplier
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent.withOpacity(0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                  child: Text(
                                'Supplier',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )))
                          : Center(
                              child: GestureDetector(
                                  onTap: () {
                                    isSupplier = true;
                                    setState(() {});
                                  },
                                  child: Text(
                                    'Supplier',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ))),
                      SizedBox(
                        width: 100,
                      ),
                      !isSupplier
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent.withOpacity(0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                  child: Text(
                                'Client',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )))
                          : Center(
                              child: GestureDetector(
                                  onTap: () {
                                    isSupplier = false;
                                    setState(() {});
                                  },
                                  child: Text(
                                    'Client',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: _formKey,

                  child: Column(
                    children: [
                      AuthField(
                          label: "Mobile Number",
                          validate: Validation(context).empty,
                          controller: _mobileController,
                          icon: Icon(
                            Icons.mobile_friendly_outlined,
                            color: Colors.white,
                          ),
                          isPassword: false,
                          isNumbers: true),
                      AuthField(
                          label: "Password",
                          controller: _passController,

                          validate:  Validation(context).empty,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          isPassword: true,
                          isNumbers: false),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
    Consumer<LoginProvider>(
    builder: (ctx, data, child) =>
                 data.wait_supplier_login?Center(child: CircularProgressIndicator(),): RoundButton(
                      onPressed: () async{
    if (_formKey.currentState.validate()) {
   if(isSupplier) await data.login_supplier(_mobileController.text,_passController.text,context);
   else await data.login_client(_mobileController.text,_passController.text,context);





    }

                      },
                      text: "Login"),
                ),
                SizedBox(
                  height: 20,
                ),
                LinkText(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  },
                  text: 'Register new account',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
