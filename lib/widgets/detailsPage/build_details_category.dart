import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildDetailsCategory(String text, size, isDarkMode) {
  return Padding(
    padding: EdgeInsets.only(
      left: size.width * 0.02,
      top: size.height * 0.015,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: isDarkMode
              ? Colors.white.withOpacity(0.7) //text color
              : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.03,
        ),
      ),
    ),
  );
}
