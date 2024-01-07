import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/model/history_order.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewHistroy extends StatelessWidget {
  ViewHistroy({super.key, required this.data});

  final HistoryOrder data;
  final CartController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReuseAppBar(
          leading: Icons.arrow_back_ios_new_outlined,
          title: "",
        ),
        body: ListView(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _controller.orderHistorys.length,
              itemBuilder: (context, index) {
                final orderItems = _controller.orderHistorys[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 13),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  'assets/image/food/6.png',
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Coca",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "\$ 20",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Outfit',
                                      color: bPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  Text("12-11-2024"),
                                  // Text(orderItems.orderDate),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
