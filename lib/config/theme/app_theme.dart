import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        //* General */
        useMaterial3: true,
        colorSchemeSeed: colorPrimary,

        ///* Texts
        textTheme: TextTheme(
            titleLarge: GoogleFonts.montserratAlternates()
                .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.montserratAlternates()
                .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            titleSmall:
                GoogleFonts.montserratAlternates().copyWith(fontSize: 20)),

        ///* Scaffold Background Color
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      );
}
