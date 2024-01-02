import 'package:delivery_app/repository/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  late TabController tabcontroller;
  RxInt currentIndex = 0.obs;

  final homeList = <ProductDetile>[].obs;

  @override
  void onReady() {
    super.onReady();
    filterByTabIndex(0);
  }

  void updateCurrentIndex() {
    currentIndex(tabcontroller.index);
    filterByTabIndex(tabcontroller.index);
  }

  void filterByTabIndex(int index) {
    final list = lstMainData.firstWhere(
        (element) => element.tabLabel == lstMainData[index].tabLabel);
    homeList(list.productDetile);
  }
}
