import 'package:delivery_app/repository/data.dart';
import 'package:get/get.dart';

class SeemoreController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    searchByTitle("");
  }

  final serachResult = <ProductDetile>[].obs;

  void searchByTitle(String searchText) {
    serachResult.value = lstMainData
        .expand((element) => element.productDetile)
        .where((element) =>
            element.title!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
