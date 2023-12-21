// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:flutter/material.dart';

class TextFormFieldReuse extends StatelessWidget {
  TextFormFieldReuse({
    super.key,
    this.obscureText,
    this.onPressedFunction,
    this.icons,
    this.controller,
    this.validator,
  });

  final bool? obscureText;
  final TextEditingController? controller;
  final VoidCallback? onPressedFunction;
  final IconData? icons;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: Icon(icons),
        focusColor: Colors.white,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

class TextFieldLable extends StatelessWidget {
  TextFieldLable({
    required this.labelText,
    super.key,
  });

  String labelText;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$labelText",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }
}

class HelperTextFiled extends StatelessWidget {
  HelperTextFiled({
    required this.Label,
    super.key,
  });
  String Label;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$Label",
      style: TextStyle(
        color: bPrimaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
