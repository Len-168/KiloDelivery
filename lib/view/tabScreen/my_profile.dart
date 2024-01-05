import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/my_profile.dart';
import 'package:delivery_app/widget/reuseProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(
        leading: Icons.arrow_back_ios_new_outlined,
        title: "My Profile",
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainTextMtProfile(label: 'Infomation'),
          SizedBox(height: 15),
          Container(
            width: Get.width,
            height: 140,
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
                _buildRowPic(),
                _buildDeite(),
              ],
            ),
          ),
          SizedBox(height: 60),
          mainTextMtProfile(label: "Payment Method"),
          SizedBox(height: 20),
          _buidlPaymentMethod(),
        ],
      ),
    );
  }

  Widget _buidlPaymentMethod() {
    return Container(
      width: Get.width,
      height: 250,
      padding: EdgeInsets.only(left: 10, top: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MethodMyprofile(
            label: "Card",
            color: Colors.orange,
            image: back,
          ),
          lineMyprofile(),
          MethodMyprofile(
            label: "Bank account",
            color: Colors.pink,
            image: card,
          ),
          lineMyprofile(),
          MethodMyprofile(
            label: "Paypal",
            color: Colors.blue,
            image: paypal,
          ),
        ],
      ),
    );
  }

  Widget _buildDeite() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
          SizedBox(height: 8),
          subtextProfile(label: "siempolen168@gmail.com"),
          SizedBox(height: 8),
          Container(
            width: 180,
            height: 50,
            child: subtextProfile(
              label: "NR1. Kompang Trabek, PreyVeng, Camboida 1200",
            ),
          )
        ],
      ),
    );
  }

  Column _buildRowPic() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          width: 70,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(
                  'https://scontent.fpnh10-1.fna.fbcdn.net/v/t39.30808-6/265994151_1185635701963659_8941339380786737517_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9c7eae&_nc_eui2=AeF5_Y8LA-gibLOfF7k7sRwFkXiBZM5uupGReIFkzm66kftlMbITT5fi_eAsJgFYDWHQGDjDrLrXyv6rYxFUJEUh&_nc_ohc=446cWJ0TMkUAX8fII65&_nc_ht=scontent.fpnh10-1.fna&oh=00_AfBEvJTJLXEYbQneIuba0BaRQupx1xjAdtaRwt-zI_hSfw&oe=659BFA44',
                ),
                fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}
