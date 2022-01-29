import 'package:flutter/material.dart';

OutlineInputBorder buildTextFieldBorder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.5),
      width: 1,
    ),
  );
}
