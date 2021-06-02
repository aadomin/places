import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Color(0xff3b3e5b), // 3b3e5b
  primaryColorLight: Color(0xff7c7e92), // 7c7e92
  primaryColorDark: Color(0xff252849), // 252849
  accentColor: Color(0xFF4CAF50),
  //
  canvasColor: Colors.white,
  unselectedWidgetColor: Color(0x503B3E5B),
  disabledColor: Color(0xfff5f5f5),
  //
  selectedRowColor: Color(0xff3b3e5b),
  //
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Color(0xFF4CAF50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Color(0xff3b3e5b)),
  ),
  sliderTheme: SliderThemeData.fromPrimaryColors(
    primaryColor: Color(0xFF4CAF50),
    primaryColorDark: Color(0xff252849),
    primaryColorLight: Color(0xff7c7e92),
    valueIndicatorTextStyle: TextStyle(
      fontSize: 14,
    ),
  ),
);

final darkTheme = ThemeData(
  primaryColor: Colors.white,
  primaryColorLight: Color(0xff7c7e92),
  primaryColorDark: Colors.white,
  accentColor: Color(0xFF4CAF50),
  //
  canvasColor: Color(0xff21222C),
  unselectedWidgetColor: Color(0x7f7C7E92),
  disabledColor: Color(0x5f1A1A20),
  //
  selectedRowColor: Colors.white,
  //
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Color(0xFF4CAF50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.white),
  ),
);
