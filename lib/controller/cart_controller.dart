import 'package:delivery_app/repository/repo_local.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final productDetails = <ProductDetile>[].obs;
  final productStorage = ProductStorage.instance;
  var favIconState = false;

  void Save(ProductDetile productDetile) async {
    final isSave =
        await productStorage.putProductDetail(productDetile, "ProductItems");
    if (isSave) {
      print("=============================Save");
    }
  }

  void getProduct() async {
    final imageDetails = await productStorage.getProductItems("ProductItems");
    productDetails.value = imageDetails;
  }

  void deleteCart(ProductDetile productDetile) async {
    final index = productDetails
        .indexWhere((element) => element.title == productDetile.title);
    productDetails.removeAt(index);
    await productStorage.putProductDetails(productDetails, "ProductItems");
  }

//
//   Fav Controller
//
  void initData(ProductDetile productDetile) async {
    favIconState = await isContain(productDetile);
    update();
  }

  Future<List<ProductDetile>> getAllProducts() async =>
      await productStorage.getProductItems("FavItems");

  Future<bool> isContain(ProductDetile productDetile) async {
    final allList = await getAllProducts();
    return allList
            .indexWhere((element) => element.title == productDetile.title) !=
        -1;
  }

  void saveFavItem(ProductDetile productDetile) async {
    final isExist = await isContain(productDetile);
    if (isExist) {
      deleteFavItem(productDetile);
      favIconState = false;
      update();
      debugPrint("save == false");
      return;
    }

    final isSave =
        await productStorage.putProductDetail(productDetile, "FavItems");
    favIconState = isSave;
    update();
  }

  void getProductFavItem() async {
    final imageDetails = await productStorage.getProductItems("FavItems");
    productDetails.value = imageDetails;
  }

  void deleteFavItem(ProductDetile productDetile) async {
    final allProducts = await getAllProducts();
    final index = allProducts
        .indexWhere((element) => element.title == productDetile.title);
    if (index != -1) {
      allProducts.removeAt(index);
      await productStorage.putProductDetails(allProducts, "FavItems");
    }
  }
}
