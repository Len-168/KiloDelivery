// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/controller/fav_controller.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class FavScreen extends StatefulWidget {
  FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late FavController _controller = Get.find();
  late CartController _cartController = Get.find();
  void initState() {
    super.initState();
    _controller.getProductFavItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(
        leading: Icons.arrow_back_ios_new,
        title: "Favorite",
      ),
      body: ListView(
        children: [
          _buildGuySwipe(),
          _buildListCart(),
        ],
      ),
    );
  }

  Widget _buildListCart() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _controller.productDetails.length,
        itemBuilder: (context, index) {
          final FavData = _controller.productDetails[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Slidable(
                endActionPane: ActionPane(
                  motion: BehindMotion(),
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        _cartController.Save(FavData);
                      },
                      backgroundColor: Colors.green,
                      icon: Icons.shopping_cart_outlined,
                      spacing: 12,
                      autoClose: true,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        _controller.deleteFavItem(FavData);
                      },
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      spacing: 12,
                      autoClose: true,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
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
                                '${FavData.image}',
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
                              "${FavData.title}",
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
                                  "\$ ${FavData.price}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Outfit',
                                    color: bPrimaryColor,
                                  ),
                                ),
                                SizedBox(width: 100),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: bPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      bottom: 5,
                                      top: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "-",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "+",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  Widget _buildGuySwipe() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.swap_horiz_sharp,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(width: 5),
          Text('swipe on an item to delete', style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
