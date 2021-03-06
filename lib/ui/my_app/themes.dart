import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: const Color(0xff3b3e5b), // 3b3e5b
  primaryColorLight: const Color(0xff7c7e92), // 7c7e92
  primaryColorDark: const Color(0xff252849), // 252849
  accentColor: const Color(0xFF4CAF50),
  //
  canvasColor: Colors.white,
  unselectedWidgetColor: const Color(0x503B3E5B),
  disabledColor: const Color(0xfff5f5f5),
  //
  selectedRowColor: const Color(0xff3b3e5b),
  //
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF4CAF50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: const Color(0xff3b3e5b)),
  ),
  sliderTheme: SliderThemeData.fromPrimaryColors(
    primaryColor: const Color(0xFF4CAF50),
    primaryColorDark: const Color(0xff252849),
    primaryColorLight: const Color(0xff7c7e92),
    valueIndicatorTextStyle: const TextStyle(
      fontSize: 14,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent, // для закругления
  ),
);

final darkTheme = ThemeData(
  primaryColor: Colors.white,
  primaryColorLight: const Color(0xff7c7e92),
  primaryColorDark: Colors.white,
  accentColor: const Color(0xFF4CAF50),
  //
  canvasColor: const Color(0xff21222C),
  unselectedWidgetColor: const Color(0x7f7C7E92),
  disabledColor: const Color(0x5f1A1A20),
  //
  selectedRowColor: Colors.white,
  //
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF4CAF50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.white),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent, // для закругления
  ),
);
