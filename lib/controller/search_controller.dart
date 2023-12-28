import 'package:delivery_app/repository/data.dart';
import 'package:get/get.dart';

class FindController extends GetxController {
  final serachResult = [].obs;

  void searchByTitle(String searchText) {
    serachResult.value = lstMainData
        .expand((element) => element.productDetile)
        .where((element) =>
            element.title!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
