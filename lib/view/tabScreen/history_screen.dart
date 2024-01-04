import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController _controller = Get.find();
    _controller.getOrderHistory();
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(title: "History Order"),
      body: Obx(
        () => ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _controller.orderHistorys.length,
              itemBuilder: (context, index) {
                final order = _controller.orderHistorys[index];

                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 2,
                        )
                      ],
                    ),
                    // child: Text(order.orderDate),
                    child: Center(
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            'Len',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Kilo Delivery',
                          ),
                          trailing: Column(
                            children: [
                              Text(
                                "- \$${order.totalAmount.toString()}",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // Text(order.orderDate),
                              // Text(YYYY_MM_DD.toString()),
                            ],
                          )),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
