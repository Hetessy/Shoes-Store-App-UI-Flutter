import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store_app_ui/data/shoes.dart';
import 'package:shoes_store_app_ui/screens/details_page.dart';

Padding buildBestSellingProduct(Size size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.035,
      vertical: size.height * 0.025,
    ),
    child: Container(
      height: size.height * 0.19,
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
              name: shoes[5]['name'],
              userName: shoes[5]['userName'],
              userFollowers: shoes[5]['userFollowers'],
              description: shoes[5]['description'],
              price: shoes[5]['price'],
              size: shoes[5]['size'],
              isRotated: shoes[5]['isRotated'],
              userImage: shoes[5]['userImage'],
              image: shoes[5]['image'],
            ),
          );
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.023,
                  horizontal: size.width * 0.025,
                ),
                child: Image.network(
                  shoes[5]['image'],
                  loadingBuilder: (
                    context,
                    child,
                    loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return Image.network(
                        shoes[5]['image'],
                        width: size.width * 0.4,
                      );
                    } else {
                      return const CircularProgressIndicator.adaptive();
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const CircularProgressIndicator.adaptive();
                  },
                  width: size.width * 0.4,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: size.width * 0.88,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shoes[5]['name'],
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.036,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        "${shoes[5]['price']}\$".toString(),
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.036,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.88,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shoes[5]['description'],
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.03,
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.7)
                              : Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "EU ${shoes[5]['size']}",
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
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
