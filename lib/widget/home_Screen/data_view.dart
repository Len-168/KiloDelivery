// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:delivery_app/view/detial_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dataView extends StatelessWidget {
  dataView({
    super.key,
    required this.list,
  });

  List<ProductDetile> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final data = list[index];
        return Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => DetialScreen(data: list[index]));
                    },
                    child: Container(
                      width: 180,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 3,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            width: 120,
                            height: 60,
                            child: Text(
                              "${data.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "\$ ${data.price}",
                            style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: bPrimaryColor),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 15,
                child: Center(
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset('${data.image}'),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
