import 'package:flutter/material.dart';

import 'package:shoes_store_app_ui/data/shoes.dart';
import 'package:shoes_store_app_ui/widgets/homePage/shoes_wisget/build_shoes.dart';

SizedBox buildShoesSlider(Size size, bool isDarkMode) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.78,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: shoes.length,
      itemBuilder: (context, i) {
        return buildShoes(size, isDarkMode, i);
      },
    ),
  );
}
