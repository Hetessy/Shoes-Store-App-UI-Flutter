import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store_app_ui/data/shoes.dart';
import 'package:shoes_store_app_ui/widgets/detailsPage/build_details_category.dart';
import 'package:shoes_store_app_ui/widgets/detailsPage/build_follow_button.dart';
import 'package:shoes_store_app_ui/widgets/homePage/shoes_wisget/build_shoes.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String userName;
  final int userFollowers;
  final String description;
  final int price;
  final int size;
  final bool isRotated;
  final String userImage;
  final String image;

  const DetailsPage({
    Key? key,
    required this.name,
    required this.userName,
    required this.userFollowers,
    required this.description,
    required this.price,
    required this.size,
    required this.isRotated,
    required this.userImage,
    required this.image,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
            top: size.height * 0.008,
          ),
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.1,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff0f0f0f)
                      : const Color(0xffebebeb),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  UniconsLine.arrow_circle_left,
                  color: isDarkMode ? const Color(0xff314d78) : Colors.indigo,
                ),
              ),
            ),
          ),
        ),
        titleSpacing: 0,
        leadingWidth: size.width * 0.13,
        title: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.1,
            ),
            child: Text(
              widget.name,
              style: GoogleFonts.lato(
                fontSize: size.width * 0.045,
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xff0f0f0f) : const Color(0xffebebeb),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              buildDetailsCategory('Selected Offer', size, isDarkMode),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.008,
                  horizontal: size.width * 0.03,
                ),
                child: Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.035,
                          ),
                          child: widget.isRotated
                              ? Image.network(
                                  widget.image,
                                  loadingBuilder: (
                                    context,
                                    child,
                                    loadingProgress,
                                  ) {
                                    if (loadingProgress == null) {
                                      return Image.network(
                                        widget.image,
                                        width: size.width * 0.52,
                                      );
                                    } else {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    }
                                  },
                                  errorBuilder: (
                                    context,
                                    error,
                                    stackTrace,
                                  ) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  },
                                  width: size.width * 0.4,
                                )
                              : Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(pi),
                                  child: Image.network(
                                    widget.image,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return Image.network(
                                          widget.image,
                                          width: size.width * 0.52,
                                        );
                                      } else {
                                        return const CircularProgressIndicator
                                            .adaptive();
                                      }
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    },
                                    width: size.width * 0.4,
                                  ),
                                ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: GoogleFonts.lato(
                                  fontSize: size.width * 0.036,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                "${widget.price}\$".toString(),
                                style: GoogleFonts.lato(
                                  fontSize: size.width * 0.036,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.description,
                                  style: GoogleFonts.lato(
                                    fontSize: size.width * 0.03,
                                    color: isDarkMode
                                        ? Colors.white.withOpacity(0.7)
                                        : Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "EU ${widget.size}",
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                ),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                        ),
                        child: CircleAvatar(
                          foregroundImage: NetworkImage(
                            widget.userImage,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.013,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              style: GoogleFonts.lato(
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              "Followers ${widget.userFollowers}",
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
                      buildFollowButton(size, isDarkMode),
                    ],
                  ),
                ),
              ),
              buildDetailsCategory("Other similar offers", size, isDarkMode),
              SizedBox(
                height: size.height * 0.78,
                child: ListView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shoes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return SizedBox(
                      child: buildShoes(size, isDarkMode, i),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
