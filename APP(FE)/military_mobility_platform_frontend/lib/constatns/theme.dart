import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kAppTheme = ThemeData(
    primaryColor: const Color(0xFF6200EE),
    dividerColor: const Color(0xFFD1C9C9),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.roboto(
            color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.roboto(
            color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
        titleSmall: GoogleFonts.roboto(
            color: Colors.white, fontSize: 8.0, fontWeight: FontWeight.bold),
        bodyLarge: GoogleFonts.roboto(color: Colors.black, fontSize: 40.0),
        bodyMedium: GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
        bodySmall: GoogleFonts.roboto(color: Colors.black, fontSize: 10.0),
        labelLarge: GoogleFonts.roboto(color: Colors.black, fontSize: 27.0),
        labelMedium: GoogleFonts.roboto(color: Colors.black, fontSize: 12.0),
        labelSmall: GoogleFonts.roboto(color: Colors.black, fontSize: 8.0)),
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
