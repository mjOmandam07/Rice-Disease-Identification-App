import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    debugPrint(size.width.toString());
    path.lineTo(0, size.height / 2);
    var firstControlPoint = new Offset(size.width / 4, size.height / 2.5);
    var firstEndPoint = new Offset(size.width / 2, size.height / 2);
    var secondControlPoint =  new Offset(size.width / 1.1, size.height /1.5); //0.5
    var secondEndPoint = new Offset(size.width, size.height / 1.8);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}