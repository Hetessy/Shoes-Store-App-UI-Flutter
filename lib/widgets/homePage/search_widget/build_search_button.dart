import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

SizedBox buildSearchButton(Size size) {
  return SizedBox(
    width: size.width * 0.12,
    height: size.height * 0.0525,
    child: Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.025,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: size.height * 0.065,
          width: size.width * 0.14,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            color: Color(0xff3b22a1),
          ),
          child: Icon(
            UniconsLine.check,
            color: Colors.white,
            size: size.height * 0.032,
          ),
        ),
      ),
    ),
  );
}
