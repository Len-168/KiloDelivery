import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/model/history_order.dart';
import 'package:delivery_app/view/tabScreen/cart_screen.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewHistroy extends StatelessWidget {
  ViewHistroy({super.key, required this.data});

  final HistoryOrder data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(
        title: "Your Order",
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 1.5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.items.length,
              itemBuilder: (context, index) {
                final orderItems = data.items[index];
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              orderItems.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width / 2.3,
                                child: Text(
                                  "${orderItems.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Total \$ ${((orderItems.price)! * (orderItems.qty)).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 100),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "items ${orderItems.qty}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: bPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        "\$ ${data.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: bPrimaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "Items",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "X ${data.getItemsCount()}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: bPrimaryColor),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 2.3,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.snackbar("Alert", "Comming Soon");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(
                                color: Colors.grey,
                              )),
                          child: Text(
                            "Rating",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2.3,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => CartScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bPrimaryColor,
                            elevation: 0,
                          ),
                          child: Text(
                            "Order Again",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
