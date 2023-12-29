// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/navigation_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  NavigationController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _controller.lstScreen[_controller.currentIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        currentIndex: _controller.currentIndex.value,
        onTap: (index) {
          _controller.pageChange(index);
        },
        selectedItemColor: bPrimaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 38,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 35,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
