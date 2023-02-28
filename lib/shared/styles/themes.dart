import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFEE946A),
      unselectedItemColor: Colors.grey.shade600,
    ),
    fontFamily: 'Montserrat',
    drawerTheme: const DrawerThemeData(),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    primaryColor: const Color(0xFFF5F1EE),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    ));

ThemeData darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      selectedItemColor: Colors.lightGreen,
      selectedIconTheme: IconThemeData(
        color: Colors.lightGreen,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.lightGreen,
      ),
    ),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.white,
      suffixIconColor: Colors.white,
      prefixIconColor: Colors.white,
      fillColor: Colors.white,
      hintStyle: TextStyle(
        color: Colors.grey[200],
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    primarySwatch: Colors.lightGreen,
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: const Color(0xFFF5F1EE),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Color(0xFFF5F1EE),
      elevation: 0.0,
    ));
