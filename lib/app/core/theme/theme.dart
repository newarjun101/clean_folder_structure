import 'package:flutter/material.dart';
import '../utils/color_constatns.dart';

class StyleTheme {
  ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: primaryColor,
        hintColor: const Color(0xffACACAC),
        scaffoldBackgroundColor: scaffoldBackground,
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: primaryColor),
        inputDecorationTheme:
            const InputDecorationTheme(fillColor: Color(0xffE5E5E5)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            //  secondary: primaryColor,
            secondaryContainer: secondaryContainer,
            onPrimary: onPrimary,
            primaryContainer: primaryContainer),
        textTheme: const TextTheme(
          labelMedium: TextStyle(color: Color(0xff5A596A)),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.black),
          headline1: TextStyle(color: onPrimary),
          caption: TextStyle(color: primaryColor),
        ));
  }
}
