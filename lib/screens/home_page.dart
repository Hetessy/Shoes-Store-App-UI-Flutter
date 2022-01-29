import 'package:flutter/material.dart';
import 'package:shoes_store_app_ui/widgets/homePage/build_best_selling_product.dart';
import 'package:shoes_store_app_ui/widgets/homePage/build_search_widget.dart';
import 'package:shoes_store_app_ui/widgets/homePage/build_shoes_slider.dart';
import 'package:shoes_store_app_ui/widgets/homePage/build_category.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: isDarkMode
            ? const Color(0xff0f0f0f) //bg color
            : const Color(0xffebebeb),
        leading: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
          ),
          child: Container(
            height: size.width * 0.1,
            width: size.width * 0.1,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xff0f0f0f) //bd color
                  : const Color(0xffebebeb),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: Icon(
              UniconsLine.bars,
              color: isDarkMode
                  ? Colors.white //icon color
                  : const Color(0xff3b22a1),
              size: size.height * 0.025,
            ),
          ),
        ),
        titleSpacing: 0,
        leadingWidth: size.width * 0.15,
        title: Image.asset(
          isDarkMode
              ? 'assets/SobGOGlight.png' //logo image
              : 'assets/SobGOGdark.png',
          height: size.height * 0.06,
          width: size.width * 0.35,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff0f0f0f) //bd color
                      : const Color(0xffebebeb),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  UniconsLine.shopping_cart_alt,
                  color: isDarkMode
                      ? Colors.white //icon color
                      : const Color(0xff3b22a1),
                  size: size.height * 0.028,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: isDarkMode ? const Color(0xff0f0f0f) : const Color(0xffebebeb),
        child: ListView(
          children: [
            buildSearchWidget(size, isDarkMode),
            buildCategory('Best Selling', size, isDarkMode),
            buildBestSellingProduct(size, isDarkMode),
            buildCategory('Most Popular', size, isDarkMode),
            buildShoesSlider(size, isDarkMode),
          ],
        ),
      ),
    );
  }
}
