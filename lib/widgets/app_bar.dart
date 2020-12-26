import 'package:flutter/cupertino.dart';

class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    // path.quadraticBezierTo(3 / 4 * size.width, size.height, size.width, size.height - 20);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
