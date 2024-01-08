import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/model/history_order.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final orderItems = data.items[index];

              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(color: Colors.grey),
                      // ),
                      ),
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
                      SizedBox(width: 10),
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
                            Row(
                              children: [
                                Text(
                                  "Total \$ ${(orderItems.price)! * (orderItems.qty)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 100),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Text(
                                    "X ${orderItems.qty}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: bPrimaryColor,
                                    ),
                                  ),
                                ),
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
      ),
    );
  }
}
