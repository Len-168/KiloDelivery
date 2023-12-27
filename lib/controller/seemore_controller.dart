import 'package:delivery_app/repository/data.dart';
import 'package:get/get.dart';

class SeemoreController extends GetxController {
  final seemoreList = <ProductDetile>[].obs;

  @override
  void onReady() {
    super.onReady();
    List<ProductDetile> tmpList = [];

    lstMainData.forEach((element) {
      tmpList.addAll(element.productDetile);
    });

    seemoreList(tmpList);
  }
}
