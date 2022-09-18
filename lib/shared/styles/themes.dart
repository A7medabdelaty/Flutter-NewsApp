import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Colors.deepOrange),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[300],
        statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
    color: Colors.white,
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    iconTheme: const IconThemeData(
      color: Colors.deepOrange,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.blueGrey,
  ),
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepOrange,
);
ThemeData darkTheme = ThemeData(
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Colors.deepOrange),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[300],
        statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
    color: Colors.white,
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    iconTheme: const IconThemeData(
      color: Colors.deepOrange,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.blueGrey,
  ),
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepOrange,
);
