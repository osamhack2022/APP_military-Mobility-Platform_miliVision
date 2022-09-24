import 'package:flutter/material.dart';

final kAppTheme = ThemeData(
    primaryColor: const Color(0xFF6200EE),
    primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Roboto',
            fontSize: 27.0,
            fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Roboto',
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Roboto',
            fontSize: 12.0,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontSize: 23.0),
        bodyMedium: TextStyle(
            color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontSize: 17.0),
        bodySmall: TextStyle(
            color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontSize: 10.0),
        labelLarge: TextStyle(
            color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontSize: 18.0),
        labelMedium: TextStyle(
            color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontSize: 11.0),
        labelSmall: TextStyle(
            color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontSize: 8.0)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF6200EE),
        iconTheme: IconThemeData(
          opacity: 1.0,
          color: Color(0xFFFFFFFF),
        ),
        actionsIconTheme: IconThemeData(
          opacity: 0.75,
          color: Color(0xFFFFFFFF),
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF6200EE),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
    ));
