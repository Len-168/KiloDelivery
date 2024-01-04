import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:delivery_app/widget/detile_Screen/reusable_detile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetialScreen extends StatefulWidget {
  DetialScreen({super.key, required this.data});

  final ProductDetile data;

  @override
  State<DetialScreen> createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen> {
  final CartController _cartController = Get.find();

  void initState() {
    super.initState();
    Future.microtask(() {
      _cartController.initData(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Scaffold(
        appBar: ReuseAppBar(
          leading: Icons.arrow_back_ios_new,
          action:
              controller.favIconState ? Icons.favorite : Icons.favorite_border,
          CallBack: () {
            controller.saveFavItem(widget.data);
          },
          title: "",
        ),
        body: _buildBody(controller),
      ),
    );
  }

  Widget _buildBody(CartController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Container(
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    '${widget.data.image}',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: Column(
            children: [
              nameFood_detile(text: "${widget.data.title}"),
              SizedBox(height: 10),
              priceFood_detile(text: "${widget.data.price}"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detile_title(
                text: "Delivery Info",
              ),
              SizedBox(height: 10),
              detileSubText(
                text: "${widget.data.deliverInfo}",
                MaxLine: 2,
              ),
              SizedBox(height: 35),
              detile_title(
                text: "Return policy",
              ),
              SizedBox(height: 10),
              detileSubText(
                text: "${widget.data.Policy}",
                MaxLine: 4,
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  _cartController.Save(widget.data);
                },
                child: buttonApp(
                  label: 'Add to Card',
                  Left: 0,
                  Right: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
