import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store_app_ui/widgets/homePage/text_field/build_text_field.dart';

Padding buildSearchWidget(Size size, bool isDarkMode) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.03,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'You will be able to go anywhere',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: isDarkMode ? Colors.white : const Color(0xff3b22a1),
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.01,
            ),
            child: Align(
              child: Text(
                'Search for the best offer',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: isDarkMode ? Colors.white : const Color(0xff3b22a1),
                  fontSize: size.width * 0.035,
                ),
              ),
            ),
          ),
          buildTextField(size, isDarkMode),
        ],
      ),
    ),
  );
}
