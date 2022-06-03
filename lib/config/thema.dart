import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:flutter/material.dart';

baseThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffffb85a),
    canvasColor: const Color(0xffffffff),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    bottomAppBarColor: const Color(0xffffffff),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0xffb7b7b7),
    highlightColor: const Color(0xffff9000),
    splashColor: const Color(0xffffe9cc),
    selectedRowColor: const Color(0xfff5f5f5),
    unselectedWidgetColor: const Color(0xff364f6c),
    disabledColor: const Color(0xffb7b7b7),
    toggleableActiveColor: const Color(0xff169cac),
    secondaryHeaderColor: const Color(0xfffff4e5),
    backgroundColor: const Color(0xffffd399),
    dialogBackgroundColor: const Color(0xffffffff),
    indicatorColor: const Color(0xffff9000),
    hintColor: const Color(0x8a000000),
    errorColor: const Color(0xffc04757),
    textTheme: const TextTheme(
      headlineSmall:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(color: BaseColorPalet.main),
    ),
    //primaryColor: BaseColorPalet.main,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20,
        selectedItemColor: BaseColorPalet.main,
        unselectedItemColor: Colors.grey),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xff364f6c),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      helperStyle: TextStyle(
        color: Color(0xffb7b7b7),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: TextStyle(
        color: Color(0xff364f6c),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorMaxLines: null,
      isDense: true,
      contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
      isCollapsed: false,
      counterStyle: TextStyle(
        color: Color(0xffb7b7b7),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      filled: true,
      fillColor: Color(0xffeaf1f3),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffc04757),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          gapPadding: 4),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          gapPadding: 4),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffc04757),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          gapPadding: 4),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          gapPadding: 4),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          gapPadding: 4),
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          gapPadding: 4),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff169cac),
      selectionColor: Color(0xffffd399),
      selectionHandleColor: Color(0xffffbd66),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff364f6c),
      opacity: 1,
      size: 24,
    ),
  );
}
