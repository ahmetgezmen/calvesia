import 'package:flutter/material.dart';

BASEThemeData() {
  return ThemeData(
    primarySwatch: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey
    ),

  );
}
