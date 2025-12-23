import 'package:flutter/material.dart';
class AppFonts {
  AppFonts._();

  static double _responsiveFont(BuildContext context, double fontSize){
    return MediaQuery.of(context).size.width * (fontSize/344);
  }

  static double h1(BuildContext context) => _responsiveFont(context, 70);
  static double h2(BuildContext context) => _responsiveFont(context, 35);
  static double h3a(BuildContext context) => _responsiveFont(context, 23.33);
  static double h3(BuildContext context) => _responsiveFont(context, 17.5);
  static double h4(BuildContext context) => _responsiveFont(context, 13.125);
}