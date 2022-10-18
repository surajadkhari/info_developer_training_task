import 'package:flutter/material.dart';

import '../dashboard/presentation/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Dashbaord(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: const Color(0xff336351),
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
              color: Color(0xff336351),
              fontSize: 26,
              fontWeight: FontWeight.w600),
          centerTitle: false,
        ),
      ),
    );
  }
}
