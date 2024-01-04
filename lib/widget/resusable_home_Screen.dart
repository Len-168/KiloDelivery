// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextLogoSerach extends StatelessWidget {
  TextLogoSerach({
    super.key,
    required this.mainText,
    required this.width,
  });
  String mainText;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Text(
      // "Delicious",
      mainText,
      style: TextStyle(
          color: Colors.black,
          fontSize: width,
          fontWeight: FontWeight.bold,
          fontFamily: 'AsapCondensed'),
    );
  }
}
