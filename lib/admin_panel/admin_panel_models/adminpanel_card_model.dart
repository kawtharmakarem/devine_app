import 'package:flutter/material.dart';

class AdminCardModel{
  final String title;
  final String? image;
Widget Function(BuildContext, void Function({Never? returnValue})) openBuilder;


  AdminCardModel({required this.title,  this.image,required this.openBuilder});
  
}