 import 'package:flutter/material.dart';

class GreenClipper extends CustomClipper<Path> {
  @override
getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height / 5);
    var firstControlPoint =  Offset(size.width / 5, size.height/ 4);
    var firstEndPoint =  Offset(size.width / 2, size.height / 3 - 90);
    var secondControlPoint =
         Offset(size.width - (size.width / 4), size.height / 4 - 65);
    var secondEndPoint = new Offset(size.width, size.height / 3 - 90);

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
  bool shouldReclip(CustomClipper oldClipper) 
  {
    return false;
  }
}