// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class FavScreen extends StatefulWidget {
  FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late CartController _cartController = Get.find();

  void initState() {
    _cartController.getProductFavItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(
        leading: Icons.arrow_back_ios_new,
        title: "Favorite",
      ),
      body: Obx(
        () => ListView(
          children: [
            _cartController.lstFavItems.isEmpty
                ? _buildNotResult()
                : Column(
                    children: [
                      _buildGuySwipe(),
                      _buildListCart(),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildNotResult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Image.asset(
                FavoriteIcons,
                width: 90,
              ),
              SizedBox(height: 15),
              Text(
                "No Favorite yet",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListCart() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _cartController.lstFavItems.length,
        itemBuilder: (context, index) {
          final FavData = _cartController.lstFavItems[index];
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
                      showMessage(
                          message: "Add Successful",
                          icon: Icons.check,
                          context: Get.context!);
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
                      _cartController.deleteFavItem(FavData);
                      showMessage(
                          message: "Delete Successful",
                          icon: Icons.check,
                          context: Get.context!);
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
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width / 2.3,
                            child: Text(
                              "${FavData.title}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit',
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "\$ ${FavData.price}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Outfit',
                                  color: bPrimaryColor,
                                ),
                              ),
                              SizedBox(width: 100),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
