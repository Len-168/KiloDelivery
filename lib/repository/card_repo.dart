import 'dart:convert';
import 'package:delivery_app/repository/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductStorage {
  static ProductStorage get instance => ProductStorage._internal();
  ProductStorage._internal();

  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  Future<bool> putProductDetail(ProductDetile productDetails) async {
    final productDetile = await getProductItems();
    final isExist = productDetile
        .indexWhere((element) => element.title == productDetails.title);
    if (isExist == -1) {
      productDetile.add(productDetails);
      return putProductDetails(productDetile);
    }
    return false;
  }

  Future<bool> putProductDetails(List<ProductDetile> productDetails) async {
    final pref = await _getSharePreference();
    List<String> items =
        productDetails.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList("ProductItem", items);
  }

  Future<List<ProductDetile>> getProductItems() async {
    final pref = await _getSharePreference();
    final items = pref.getStringList("ProductItem");
    return items?.map((e) => ProductDetile.fromJson(jsonDecode(e))).toList() ??
        [];
  }
}
