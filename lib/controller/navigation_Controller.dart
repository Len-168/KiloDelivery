import 'package:delivery_app/view/tabScreen/cart_screen.dart';
import 'package:delivery_app/view/tabScreen/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  var lstScreen = [
    HomeScreen(),
    Container(color: Colors.pink),
    CartScreen(),
    Container(color: Colors.pink),
    Container(color: Colors.black),
  ];

  void pageChange(int index) {
    currentIndex.value = index;
  }
}
