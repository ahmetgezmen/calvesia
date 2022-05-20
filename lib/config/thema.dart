import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:flutter/material.dart';

BASEThemeData() {
  return ThemeData(
    textTheme: const TextTheme(
      headlineSmall:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      headlineMedium:
      TextStyle(color:  BaseColorPalet.main),

    ),
    primaryColor:  BaseColorPalet.main,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20,
        selectedItemColor: BaseColorPalet.main,
        unselectedItemColor: Colors.grey),
  );
}
