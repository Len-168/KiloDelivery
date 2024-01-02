import 'package:delivery_app/repository/card_repo.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late final productDetails = <ProductDetile>[].obs;
  final productStorage = ProductStorage.instance;

  // bool _isContain(ProductDetile productDetile) =>
  //     productDetails
  //         .indexWhere((element) => element.title == productDetile.title) !=
  //     -1;

  void Save(ProductDetile productDetile) async {
    final isSave = await productStorage.putProductDetail(productDetile);
    if (isSave) {
      print("=============================Save");
    }
  }

  void getProduct() async {
    final imageDetails = await productStorage.getProductItems();
    productDetails.value = imageDetails;
  }

  void deleteCart(ProductDetile productDetile) async {
    final index = productDetails
        .indexWhere((element) => element.title == productDetile.title);
    productDetails.removeAt(index);
    await productStorage.putProductDetails(productDetails);
  }
}
