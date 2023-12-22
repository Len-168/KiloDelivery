// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buttonApp extends StatelessWidget {
  buttonApp({
    required this.label,
    super.key,
  });

  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      decoration: BoxDecoration(
        color: bPrimaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          "$label",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
