// ignore_for_file: unused_local_variable
import 'package:delivery_app/model/history_order.dart';
import 'package:delivery_app/repository/repo_local.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:delivery_app/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final productDetails = <ProductDetile>[].obs;
  final lstFavItems = <ProductDetile>[].obs;
  final productStorage = ProductStorage.instance;
  var favIconState = false;

  final orderHistorys = <HistoryOrder>[].obs;
  var totalOrderQty = 0.obs;

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
      calculateTotal();
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
    calculateTotal();
    update();
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
    } else {
      final isSave =
          await productStorage.putProductDetail(productDetile, "FavItems");
      favIconState = isSave;

      update();
      showMessage(
          message: "Add Successful", icon: Icons.check, context: Get.context!);
    }
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
    }
    showMessage(
        message: "Delete Successful", icon: Icons.check, context: Get.context!);
  }

//
//
//   History Controller
//
//
//

  void calculateTotal() async {
    final allProducts = await productStorage.getProductItems("ProductItems");
    totalOrderQty.value = allProducts.length;
  }

  HistoryOrder getCheckOutOrder() {
    var totalAty = productDetails.length;
    double totalAmount = 0.0;
    var orderDate = DateTime.now().toString();
    productDetails.forEach((item) {
      totalAmount += (item.price ?? 0.0) * item.qty;
    });

    debugPrint(totalAmount.toString());

    final HistoryOrder order =
        HistoryOrder(totalAty, totalAmount, productDetails, orderDate);
    return order;
  }

  void prepareForOrder(HistoryOrder order) async {
    await productStorage.putHistory(order);
    await productStorage.removeAllByKey(key: "ProductItems");
    productDetails.clear();
    getOrderHistory();
    calculateTotal();
    update();
  }

  void getOrderHistory() async {
    final allOrders = await productStorage.getAllHistoryOrder();
    orderHistorys(allOrders);
  }

  void increQty(index) {
    var product = productDetails.elementAt(index);
    product.qty += 1;
    productDetails[index] = product;
  }

  void deCreateQty(index) {
    var product = productDetails.elementAt(index);
    if (product.qty > 1) {
      product.qty -= 1;
      productDetails[index] = product;
    }
  }
}
