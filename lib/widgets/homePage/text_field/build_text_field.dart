import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store_app_ui/widgets/homePage/build_search_button.dart';
import 'package:shoes_store_app_ui/widgets/homePage/build_text_field_border.dart';

Padding buildTextField(Size size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.015,
      vertical: size.height * 0.015,
    ),
    child: Row(
      children: [
        SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.055,
          child: TextField(
            style: GoogleFonts.lato(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.7)
                  : Colors.black.withOpacity(0.7),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              enabledBorder: buildTextFieldBorder(),
              focusedBorder: buildTextFieldBorder(),
              border: buildTextFieldBorder(),
              hintStyle: GoogleFonts.lato(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.7)
                    : Colors.black.withOpacity(0.7),
              ),
              hintText: 'Search',
            ),
          ),
        ),
        buildSearchButton(size),
      ],
    ),
  );
}
