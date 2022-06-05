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
    splashColor: const Color(0xffffe9aa),
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
    fontFamily: "Poppins"
  );
}
