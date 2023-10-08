import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color blackFontColor = Color(0xFF171B34);
  static const Color greyFontColor = Color(0xFFbebebe);
  static const Color greyFontColor2 = Color(0xFFbdbdbd);
  static const Color greyFontColor3 = Color(0xFFA3A3A3);

  static const Color grey = Color(0xFFF0F0F0);

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xFFf03225),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFFf03225)),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.unbounded(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: blackFontColor,
          ),
          displaySmall: GoogleFonts.unbounded(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: blackFontColor,
          ),
          titleLarge: GoogleFonts.unbounded(
            fontSize: 11,
            color: greyFontColor2,
          ),
          titleMedium: GoogleFonts.unbounded(
            fontSize: 10,
            color: greyFontColor2,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: GoogleFonts.unbounded(
            color: greyFontColor,
            fontSize: 11,
          ),
          labelMedium: GoogleFonts.unbounded(
            fontSize: 10,
            color: greyFontColor3,
            height: 1.7,
          ),
          labelSmall: GoogleFonts.unbounded(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );
}
