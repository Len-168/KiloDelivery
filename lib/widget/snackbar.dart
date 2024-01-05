import 'package:flutter/material.dart';

void showMessage(
    {required String message,
    required IconData icon,
    required BuildContext context}) {
  final snackBar = SnackBar(
    content: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    ),
    elevation: 0,
    duration: Duration(seconds: 2),
    backgroundColor: Colors.green.withOpacity(0.7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    margin: EdgeInsets.all(20),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
