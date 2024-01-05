// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:flutter/material.dart';

class lineMyprofile extends StatelessWidget {
  const lineMyprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50, top: 13, bottom: 13),
      width: 250,
      height: 1,
      color: Colors.grey,
    );
  }
}

class MethodMyprofile extends StatelessWidget {
  MethodMyprofile({
    super.key,
    required this.label,
    required this.color,
    this.image,
  });
  String? label;
  Color? color;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: false,
          onChanged: (value) {},
          groupValue: 1,
          activeColor: bPrimaryColor,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              image.toString(),
              height: 30,
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(
          label!,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class mainTextMtProfile extends StatelessWidget {
  mainTextMtProfile({
    super.key,
    required this.label,
  });
  String? label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      // "Infomation",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 23,
      ),
    );
  }
}
