// ignore_for_file: unused_local_variable
import 'package:delivery_app/model/history_order.dart';
import 'package:delivery_app/repository/repo_local.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final productDetails = <ProductDetile>[].obs;
  final lstFavItems = <ProductDetile>[].obs;
  final historyItems = <ProductDetile>[].obs;
  final productStorage = ProductStorage.instance;
  var favIconState = false;

  final orderHistorys = <HistoryOrder>[].obs;
  final totalOrderAmount = 0.0.obs;

//
//
//   Cart Controller
//
//
//

  void Save(ProductDetile productDetile) async {
    final isSave =
        await productStorage.putProductDetail(productDetile, "ProductItems");
    if (isSave) {
      print("=============================Save");
    }
  }

  void getProductCart() async {
    final imageDetails = await productStorage.getProductItems("ProductItems");
    productDetails.value = imageDetails;
    print("------------Get-Cart------------");
  }

  void deleteCart(ProductDetile productDetile) async {
    final index = productDetails
        .indexWhere((element) => element.title == productDetile.title);
    productDetails.removeAt(index);
    await productStorage.putProductDetails(productDetails, "ProductItems");
  }

//
//
//   Fav Controller
//
//
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
    lstFavItems.value = imageDetails;
    print("------------Get-Fav------------");
  }

  void deleteFavItem(ProductDetile productDetile) async {
    final allProducts = await getAllProducts();
    final index = allProducts
        .indexWhere((element) => element.title == productDetile.title);

    if (index != -1) {
      allProducts.removeAt(index);
      await productStorage.putProductDetails(allProducts, "FavItems");
      getProductFavItem();
      print('------------Delete Fav--------------');
    }
  }

//
//
//   History Controller
//
//
//
  void saveHistory(HistoryOrder historyOrder) async {
    final isSave = await productStorage.putHistory(historyOrder);
    if (isSave) {
      print("=============================Save");
    }
  }

//
//
//   asasd Controller
//
//
//
  HistoryOrder getCheckOutOrder() {
    var totalAty = productDetails.length;
    double totalAmount = 0.0;
    var orderDate = DateTime.now().toString();
    productDetails.forEach((item) {
      totalAmount += item.price ?? 0.0;
    });

    final HistoryOrder order =
        HistoryOrder(totalAty, totalAmount, productDetails, orderDate);
    return order;
  }

  void prepareForOrder(HistoryOrder order) async {
    await productStorage.putHistory(order);
    await productStorage.removeAllByKey(key: "ProductItems");
    productDetails.clear();
    getOrderHistory();
  }

  void getOrderHistory() async {
    final allOrders = await productStorage.getAllHistoryOrder();
    orderHistorys(allOrders);
  }
}
