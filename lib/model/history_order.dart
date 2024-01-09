import 'dart:convert';

import 'package:delivery_app/repository/data.dart';
import 'package:intl/intl.dart';

class HistoryOrder {
  final int totalQty;
  final double totalAmount;
  final List<ProductDetile> items;
  final String orderDate;

  HistoryOrder(this.totalQty, this.totalAmount, this.items, this.orderDate);

  factory HistoryOrder.fromJson(Map<String, dynamic> json) {
    List<ProductDetile> detail = [];

    if (json['items'] != null) {
      detail = (json['items'] as List)
          .map((e) => ProductDetile.fromJson(jsonDecode(e)))
          .toList();
    }

    return HistoryOrder(
      json['totalQty'],
      json['totalAmount'],
      detail,
      json['orderDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "totalQty": totalQty,
      "totalAmount": totalAmount,
      "items": items.map((e) => jsonEncode(e.toMap())).toList(),
      "orderDate": orderDate,
    };
  }

  String formatDate() =>
      DateFormat("yyyy/MMM/dd hh:mm a").format(DateTime.parse(orderDate));

  int getItemsCount() {
    var totalQty = 0;
    items.forEach((element) {
      totalQty += element.qty;
    });
    print('------->>${totalQty}');
    return totalQty;
  }
}
