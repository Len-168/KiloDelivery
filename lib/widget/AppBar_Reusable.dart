import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar ReuseAppBar({
  IconData? leading,
  IconData? action,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(
        leading,
        color: Colors.black,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          action,
          color: Colors.black,
        ),
      )
    ],
  );
}
