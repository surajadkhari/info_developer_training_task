import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Colors.black12,
      border: InputBorder.none,
      fillColor: const Color(0xffE8E8E4),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1,
          color: Color(0xff336351),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: Color(0xff336351)),
      ),
    ),
    fontFamily: "Product Sans",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Color(0xff336351)),
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          fontFamily: "Product Sans",
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      centerTitle: false,
    ),
  );
}
