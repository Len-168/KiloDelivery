// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
// import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/view/detial_Screen.dart';
import 'package:delivery_app/widget/resusable_home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // AuthController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: bPrimaryColor,
                  ),
                  label: "asd"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: bPrimaryColor,
                  ),
                  label: "asd"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: bPrimaryColor,
                  ),
                  label: "asd"),
            ]),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogoHomeScreen(),
        _buildBoxSerach(),
        _buildTabBar(),
        _buildSeeMore(),
        _buildTabBarView(),
      ],
    );
  }

  Padding _buildSeeMore() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 30, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "See More",
            style: TextStyle(color: bPrimaryColor, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildSubTab(),
          _buildSubTab(),
        ],
      ),
    );
  }

  Widget _buildSubTab() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20),
      itemCount: 4,
      itemBuilder: (context, index) {
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
                      Get.to(() => DetialScreen());
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
                              "Veggie Tomato mix",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "\$ 200",
                            style: TextStyle(
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
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://cms.upsidefoods.com/wp-content/uploads/2023/01/FooterBowl_Small.png',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Container(
      child: TabBar(
        isScrollable: true,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.only(left: 20),
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: bPrimaryColor),
          // insets: EdgeInsets.symmetric(horizontal: 55.0),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        tabs: [
          Tab(
            child: Text(
              "Milk Tea",
              style: TextStyle(
                color: bPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Coffee",
              style: TextStyle(
                color: bPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxSerach() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Container(
        width: Get.width,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.black54,
            ),
            hintText: "Serach",
          ),
        ),
      ),
    );
  }

  Widget _buildLogoHomeScreen() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLogoSerach(
            mainText: "Delicious",
            width: 35,
          ),
          SizedBox(height: 10),
          TextLogoSerach(
            mainText: "food for you",
            width: 35,
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: InkWell(
          onTap: () {
            // _controller.logout();
          },
          child: Icon(
            Icons.menu_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black54,
            size: 30,
          ),
        )
      ],
    );
  }
}
