import 'package:flutter/material.dart';

// ignore: must_be_immutable
class labelTab extends StatelessWidget {
  labelTab({
    super.key,
    required this.label,
  });

  String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$label",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    );
  }
}
