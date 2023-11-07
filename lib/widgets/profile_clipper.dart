import 'package:flutter/material.dart';
class ProfileClipper  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0,4*size.height/5);
    OffSet curvePoint = OffSet(size.width/ 2, size.height);
    OffSet endPoint= OffSet(size.width, 4*size.height/ 5);
    path.quadraticBezierTo(
      curvePoint.dx,
      curvePoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
