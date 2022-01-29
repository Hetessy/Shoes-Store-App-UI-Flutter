import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store_app_ui/data/shoes.dart';
import 'package:shoes_store_app_ui/screens/details_page.dart';

Padding buildShoes(Size size, bool isDarkMode, int i) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.03,
      vertical: size.height * 0.015,
    ),
    child: Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: () {
          Get.to(
            DetailsPage(
              name: shoes[i]['name'],
              userName: shoes[i]['userName'],
              userFollowers: shoes[i]['userFollowers'],
              description: shoes[i]['description'],
              price: shoes[i]['price'],
              size: shoes[i]['size'],
              isRotated: shoes[i]['isRotated'],
              userImage: shoes[i]['userImage'],
              image: shoes[i]['image'],
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02,
          ),
          child: Row(
            children: [
              shoes[i]['isRotated']
                  ? Image.network(
                      shoes[i]['image'],
                      errorBuilder: (context, error, stackTrace) {
                        return const CircularProgressIndicator.adaptive();
                      },
                      width: size.width * 0.18,
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Image.network(
                        shoes[i]['image'],
                        errorBuilder: (context, error, stackTrace) {
                          return const CircularProgressIndicator.adaptive();
                        },
                        width: size.width * 0.18,
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.height * 0.019,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoes[i]['name'],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      shoes[i]['description'],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        fontSize: size.width * 0.03,
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.7)
                            : Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.019,
                  horizontal: size.width * 0.012,
                ),
                child: Column(
                  children: [
                    Text(
                      "${shoes[i]['price']}\$".toString(),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      "EU ${shoes[i]['size']}".toString(),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        fontSize: size.width * 0.03,
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.7)
                            : Colors.black.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
