import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/view/tabScreen/cart_screen.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/reuseProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar:
          ReuseAppBar(leading: Icons.arrow_back_ios_new_outlined, title: ""),
      body: _buildBody(),
    );
  }

  ListView _buildBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "change",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: bPrimaryColor),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          width: 85,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://scontent.fpnh10-1.fna.fbcdn.net/v/t39.30808-6/265994151_1185635701963659_8941339380786737517_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9c7eae&_nc_eui2=AeF5_Y8LA-gibLOfF7k7sRwFkXiBZM5uupGReIFkzm66kftlMbITT5fi_eAsJgFYDWHQGDjDrLrXyv6rYxFUJEUh&_nc_ohc=446cWJ0TMkUAX8fII65&_nc_ht=scontent.fpnh10-1.fna&oh=00_AfBEvJTJLXEYbQneIuba0BaRQupx1xjAdtaRwt-zI_hSfw&oe=659BFA44',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Siem Polen",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          subtextProfile(label: "siempolen168@gmail.com"),
                          SizedBox(height: 5),
                          lineProfile(),
                          SizedBox(height: 5),
                          subtextProfile(label: "+855 889307043"),
                          SizedBox(height: 5),
                          lineProfile(),
                          SizedBox(height: 5),
                          Container(
                            width: 180,
                            height: 50,
                            child: subtextProfile(
                              label:
                                  "NR1. Kompang Trabek, PreyVeng, Camboida 1200",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lstProfile.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: InkWell(
                onTap: () {
                  index != 0 ? null : Get.to(() => CartScreen());
                },
                child: Container(
                  width: Get.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 1,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lstProfile[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
