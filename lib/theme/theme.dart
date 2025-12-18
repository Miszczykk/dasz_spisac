import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/colors.dart';

class AppTheme {
  AppTheme._();
  static double _responsiveFont(BuildContext context, double fontSize){
    return MediaQuery.of(context).size.width * (fontSize/344);
  }

  static double h1(BuildContext context) => _responsiveFont(context, 70);
  static double h2(BuildContext context) => _responsiveFont(context, 35);
  static double h3a(BuildContext context) => _responsiveFont(context, 23.33);
  static double h3(BuildContext context) => _responsiveFont(context, 17.5);
  static double h4(BuildContext context) => _responsiveFont(context, 13.125);

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',

      textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: h1(context),
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBlue,
          ),
          displayMedium: TextStyle(
            fontSize: h2(context),
            fontWeight: FontWeight.normal,
            color: AppColors.secondaryBlue,
          ),
          headlineSmall: TextStyle(
            fontSize: h3(context),
            fontWeight: FontWeight.normal,
            color: AppColors.primaryBlue,
          ),


        displaySmall: TextStyle(
          fontSize: h3(context),
          fontWeight: FontWeight.normal,
          color: AppColors.primaryBlue,
        ),

        bodyLarge: TextStyle(
          fontSize: h3(context),
          fontWeight: FontWeight.normal,
          color: AppColors.textInputActive
        ),

        bodySmall: TextStyle(
          fontSize: h4(context),
          fontWeight: FontWeight.normal,
          color: AppColors.secondaryBlue
        ),

          labelLarge: TextStyle(
            fontSize: h2(context),
            fontWeight: FontWeight.bold,
            color: AppColors.textInputActive
          ),
          labelMedium: TextStyle(
              fontSize: h3a(context),
              fontWeight: FontWeight.bold,
              color: AppColors.textInputActive
          ),
          labelSmall: TextStyle(
              fontSize: h4(context),
              fontWeight: FontWeight.normal,
              color: AppColors.secondaryBlue
          )
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.textInputDesibled,
        selectionHandleColor: AppColors.textInputDesibled,
        selectionColor: AppColors.textInputDesibled
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgInput,
        labelStyle: TextStyle(
          color: AppColors.textInputDesibled,
          fontSize: h3(context),
          fontWeight: FontWeight.normal
        ),
        hintStyle: const TextStyle(
          color: AppColors.textInputDesibled,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.borderInput,
            width: 2
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: AppColors.borderInput,
                width: 2
            )
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bgButtonActive,
          foregroundColor: AppColors.bgButtonTextActive,
            minimumSize: const Size(double.infinity, 75),
          textStyle: TextStyle(
            fontSize: h2(context),
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
          ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10.0))
        ),
      )
    );
  }
}