import 'package:flutter/material.dart';

class SettingsCardModel{
  final String title;
  final String details;
  final Color? color;
  final String? image;

  SettingsCardModel( {required this.title, required this.details,this.color,this.image});
}