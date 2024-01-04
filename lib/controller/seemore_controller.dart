import 'dart:async';

import 'package:delivery_app/repository/data.dart';
import 'package:get/get.dart';

class SeemoreController extends GetxController {
  Timer? _debounce;
  @override
  void onReady() {
    super.onReady();
    searchByTitle("");
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  final serachResult = <ProductDetile>[].obs;

  void searchByTitle(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      serachResult.value = lstMainData
          .expand((element) => element.productDetile)
          .where((element) =>
              element.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
