import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:insideapp/widgets/auth_fields.dart';
import 'package:insideapp/widgets/link_text.dart';
import 'package:insideapp/providers/register_provider.dart';
import 'package:insideapp/widgets/round_button.dart';
import 'package:insideapp/util/validation.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSupplier = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  TextEditingController _confirmController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final Validation validation=new Validation(context);

    return Scaffold(
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
            child: SingleChildScrollView(
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
                    'Register new account',
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
              Form(
                key: _formKey,

                    child: Column(
                      children: [
                        AuthField(
                          controller: _mobileController,
                            label: "Mobile Number",
                            validate: validation.mobile,
                            icon: Icon(
                              Icons.mobile_friendly_outlined,
                              color: Colors.white,
                            ),
                            isPassword: false,
                            isNumbers: true),
                        AuthField(
                            label: "Name",
                            controller: _nameController,
                            validate: validation.empty,

                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            isPassword: false,
                            isNumbers: false),
                        AuthField(
                            controller: _passController,

                            label: "Password",
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            validate:validation.passValidator,
                            isPassword: true,
                            isNumbers: false),
                        AuthField(
                            controller: _confirmController,

                            label: "Password Confirmation",
                            icon: Icon(
                              Icons.lock,

                              color: Colors.white,
                            ),
                            validate: Validation.pass(_passController.text).matchPassword,
                            isPassword: true,
                            isNumbers: false),
                      ],
                    ),

                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                Consumer<RegisterProvider>(
                    builder: (ctx, data, child) =>
                   data.wait_client_register?Center(child: CircularProgressIndicator(),) : RoundButton(
                        onPressed: ()async {
                          if (_formKey.currentState.validate()){
                            var params={"name":_nameController.text,"mobile":_mobileController.text,"password":_passController.text};
                            if(isSupplier){
                              await data.supplier_register(params,context);
                            }
                            else{
                              await data.client_register(params,context);

                            }
                          }

                        /*  Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (contaxt) {
                            return Login();
                          }));*/
                        },
                        text: 'Register'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinkText(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      text: 'Login')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
