import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insideapp/screens/auth_screens/login.dart';
import 'package:insideapp/screens/join.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // startTimeout() async {
  //   Timer(Duration(seconds: 8), changeScreen);
  // }

  changeScreen() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return JoinApp();
          // return Walkthrough();
        },
      ),
    );
  }

  final backgroundController = FadeInController();
  final logoController = FadeInController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    backgroundController.fadeIn();
    Future.delayed(Duration(seconds: 3), () {
      logoController.fadeIn();
    });
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 2),
              pageBuilder: (context, _, __) => Login()));
    });
    // startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        controller: backgroundController,
        duration: Duration(milliseconds: 3000),
        curve: Curves.easeIn,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splash_back_ground.jpg'),
                      fit: BoxFit.cover)
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              color: Colors.black.withOpacity(0.7),
            ),
            FadeIn(
              controller: logoController,
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: "main_logo",
                        child: Image.asset(
                          'assets/logo/logo.png', width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.5,)),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.1,),
                    SpinKitDoubleBounce(color: Colors.white, size: MediaQuery
                        .of(context)
                        .size
                        .width * 0.2,)
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }


}
