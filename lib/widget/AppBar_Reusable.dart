import 'package:delivery_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar ReuseAppBar({
  IconData? leading,
  IconData? action,
  String? title,
  VoidCallback? CallBack,
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
        color: bPrimaryColor,
        size: 25,
      ),
    ),
    centerTitle: true,
    title: Text(
      title.toString(),
      style: TextStyle(
        color: Colors.black,
        fontFamily: '',
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: InkWell(
          onTap: CallBack,
          child: Icon(
            action,
            color: bPrimaryColor,
          ),
        ),
      )
    ],
  );
}
