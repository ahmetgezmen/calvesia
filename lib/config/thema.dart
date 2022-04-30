import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:flutter/material.dart';

BASEThemeData() {
  return ThemeData(
    textTheme: const TextTheme(
      headlineSmall:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
    ),
    primarySwatch: Colors.orange,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20,
        selectedItemColor: BaseColorPalet.main,
        unselectedItemColor: Colors.grey),
  );
}
