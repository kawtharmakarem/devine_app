import 'package:flutter/material.dart';

class PetalClipper extends CustomClipper<Path>{
  @override
  
  Path getClip(Size size) {
    final centerx=size.width/2;
    final centerY=size.height/2;
    double controlY=50;
    double controlX=30;
    final 
    Path path=Path();
    path.moveTo(centerx,centerY-controlY);
    path.relativeQuadraticBezierTo(controlX, controlY, 0, controlY*2);
    path.relativeQuadraticBezierTo(-controlX,-controlY, 0,-controlY*2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}