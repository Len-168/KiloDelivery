import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:delivery_app/widget/detile_Screen/reusable_detile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetialScreen extends StatelessWidget {
  const DetialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: Get.width,
                height: Get.height,
                child: Container(
                  child: Center(
                    child: Image.network(
                        height: 200,
                        'https://d1sag4ddilekf6.cloudfront.net/compressed_webp/items/KHITE20220915071704042993/detail/1736348b8c134f9b9ca6ad9ec1b5ab82_1663820367917320552.webp'),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              nameFood_detile(text: "Veggie Tomato mix"),
              SizedBox(height: 10),
              priceFood_detile(text: "200"),
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
                text:
                    "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
                MaxLine: 2,
              ),
              SizedBox(height: 30),
              detile_title(
                text: "Return policy",
              ),
              SizedBox(height: 10),
              detileSubText(
                text:
                    "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
                MaxLine: 4,
              ),
              SizedBox(height: 40),
              buttonApp(
                label: 'Add to Card',
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
