import 'package:delivery_app/repository/data.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:delivery_app/widget/detile_Screen/reusable_detile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetialScreen extends StatelessWidget {
  DetialScreen({super.key, required this.data});

  final ProductDetile data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseAppBar(),
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
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('${data.image}')),
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
              nameFood_detile(text: "${data.title}"),
              SizedBox(height: 10),
              priceFood_detile(text: "${data.price}"),
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
                text: "${data.deliverInfo}",
                MaxLine: 2,
              ),
              SizedBox(height: 30),
              detile_title(
                text: "Return policy",
              ),
              SizedBox(height: 10),
              detileSubText(
                text: "${data.Policy}",
                MaxLine: 4,
              ),
              SizedBox(height: 25),
              buttonApp(
                label: 'Add to Card',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
