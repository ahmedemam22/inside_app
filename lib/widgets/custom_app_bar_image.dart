import 'package:flutter/material.dart';

class CustomAppBarImage extends StatefulWidget {
  @override
  _CustomAppBarImageState createState() => _CustomAppBarImageState();
}

class _CustomAppBarImageState extends State<CustomAppBarImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/images/app_bar_image.png'),
      Positioned(
          top: 30,
          left: 20,
          child: Image.asset(
            'assets/images/temp_logo.png',
            width: 70,
          )),
      Positioned(
        top: 30,
        right: 100,
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
      Positioned(
        top: 30,
        right: 80,
        child: Text(
          'EN',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]);
  }
}
