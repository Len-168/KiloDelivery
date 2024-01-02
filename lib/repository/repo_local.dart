import 'dart:convert';
import 'package:delivery_app/repository/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductStorage {
  static ProductStorage get instance => ProductStorage._internal();
  ProductStorage._internal();

  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  Future<bool> putProductDetail(
      ProductDetile productDetails, String storeKy) async {
    final productDetile = await getProductItems(storeKy);
    final isExist = productDetile
        .indexWhere((element) => element.title == productDetails.title);
    if (isExist == -1) {
      productDetile.add(productDetails);
      return putProductDetails(productDetile, storeKy);
    }
    return false;
  }

  Future<bool> putProductDetails(
      List<ProductDetile> productDetails, String storeKy) async {
    final pref = await _getSharePreference();
    List<String> items =
        productDetails.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList(storeKy, items);
  }

  Future<List<ProductDetile>> getProductItems(String storeKy) async {
    final pref = await _getSharePreference();
    final items = pref.getStringList(storeKy);
    return items?.map((e) => ProductDetile.fromJson(jsonDecode(e))).toList() ??
        [];
  }
}
