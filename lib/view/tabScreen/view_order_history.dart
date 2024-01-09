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
        leading: Icons.arrow_back_ios_new_outlined,
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
                              Text(
                                "${orderItems.title}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Total \$ ${(orderItems.price)! * (orderItems.qty)}",
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
                        "\$ ${data.totalAmount}",
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
                      ElevatedButton(
                        onPressed: () {
                          Get.snackbar("Alert", "Comming Soon");
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(170, 60),
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
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => CartScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(170, 60),
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
