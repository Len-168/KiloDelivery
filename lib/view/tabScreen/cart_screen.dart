// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/model/history_order.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:delivery_app/widget/snackbar.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController _cartController = Get.find();

  void initState() {
    _cartController.getProductCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(
        leading: Icons.arrow_back_ios_new,
        title: "Order",
      ),
      floatingActionButton: InkWell(
        onTap: () {
          _showBottomSheet(context, _cartController.getCheckOutOrder());
        },
        child: buttonApp(
          label: 'Check out',
          Right: 30,
          Left: 30,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => ListView(
        children: [
          _cartController.productDetails.isEmpty
              ? _buildNotResult()
              : Column(
                  children: [
                    _buildGuySwipe(),
                    _buildListCart(),
                  ],
                )
        ],
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
                OrderIcons,
              ),
              SizedBox(height: 15),
              Text(
                "No Order yet",
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
        itemCount: _cartController.productDetails.length,
        itemBuilder: (context, index) {
          final CartData = _cartController.productDetails[index];

          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom:
                  index == _cartController.productDetails.length - 1 ? 80 : 20,
            ),
            child: Slidable(
                endActionPane: ActionPane(
                  motion: BehindMotion(),
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        _cartController.saveFavItem(CartData);
                        showMessage(
                            message: "Add Successful",
                            icon: Icons.check,
                            context: Get.context!);
                      },
                      backgroundColor: Colors.green,
                      icon: Icons.favorite_border_outlined,
                      autoClose: true,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        _cartController.deleteCart(CartData);
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            '${CartData.image}',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 165,
                              child: Text(
                                "${CartData.title}",
                                // textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "\$ ${CartData.price}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit',
                                color: bPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, right: 7),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color: bPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 5, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      _cartController.deCreateQty(index),
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    "${_cartController.productDetails[index].qty}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _cartController.increQty(index);
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Future<dynamic> _showBottomSheet(BuildContext context, HistoryOrder order) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: bAppColor,
          width: Get.width,
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: bPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Order Confirmation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                pymentcard(
                  label: "Visa Card",
                  card_type: visa_card,
                  value: 1,
                ),
                SizedBox(height: 10),
                pymentcard(
                  label: "Master Card",
                  card_type: master_card,
                  value: 0,
                ),
                SizedBox(height: 10),
                Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          "New York, Prey Veng, Cambo...",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.edit),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery time :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Total :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "15-30 Min",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "\$ ${order.totalAmount}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    _cartController.prepareForOrder(order);
                    Navigator.pop(context);
                  },
                  child: buttonApp(
                    label: 'Confirm Order',
                    Left: 0,
                    Right: 0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

class pymentcard extends StatelessWidget {
  pymentcard({
    super.key,
    required this.label,
    required this.card_type,
    required this.value,
  });

  String label;
  String card_type;
  int value;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: 1,
              onChanged: (value) {},
              activeColor: Colors.deepOrangeAccent,
            ),
            Text(
              "$label",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                card_type,
                height: 50,
              ),
            ),
          ],
        ));
  }
}
