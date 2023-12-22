// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:flutter/material.dart';

class detileSubText extends StatelessWidget {
  detileSubText({
    super.key,
    required this.text,
    required this.MaxLine,
  });
  String text;
  int MaxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.5)),
      maxLines: MaxLine,
    );
  }
}

class detile_title extends StatelessWidget {
  detile_title({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class priceFood_detile extends StatelessWidget {
  priceFood_detile({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ $text",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: bPrimaryColor),
    );
  }
}

class nameFood_detile extends StatelessWidget {
  nameFood_detile({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    );
  }
}
