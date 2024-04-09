import 'package:flutter/material.dart';

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1);// secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;
  static var highlighColor = Color.fromARGB(255, 28, 137, 215);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: highlighColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: highlighColor,
      onPrimary: whiteColor,
      secondary: blueColor,
      onSecondary: whiteColor,
      error: Colors.red,
      onError: whiteColor,
      background: drawerColor,
      onBackground: whiteColor,
      surface: greyColor,
      onSurface: whiteColor,
    ),
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: highlighColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: highlighColor,
      onPrimary: blackColor,
      secondary: blueColor,
      onSecondary: blackColor,
      error: Colors.red,
      onError: blackColor,
      background: whiteColor,
      onBackground: blackColor,
      surface: greyColor,
      onSurface: blackColor,
    ),
  );
}
