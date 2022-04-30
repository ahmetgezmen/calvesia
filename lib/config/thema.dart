import 'package:flutter/material.dart';

BASEThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700

      ),
    ),
    primarySwatch: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey
    ),
  );
}
