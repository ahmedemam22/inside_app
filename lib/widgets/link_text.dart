import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final Function onPressed;
  final String text;

  LinkText({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
