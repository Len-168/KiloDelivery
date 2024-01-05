// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class lineProfile extends StatelessWidget {
  const lineProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: 180, height: 1.5, color: Colors.grey);
  }
}

class subtextProfile extends StatelessWidget {
  subtextProfile({
    super.key,
    required this.label,
  });

  String? label;

  @override
  Widget build(BuildContext context) {
    return Text(
      // "siempolen168@gmail.com",
      label!,
      style: TextStyle(color: Colors.grey, fontSize: 15),
    );
  }
}
