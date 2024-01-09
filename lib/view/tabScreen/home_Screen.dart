// ignore_for_file: must_be_immutable
import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/controller/cart_controller.dart';
import 'package:delivery_app/controller/data_controller.dart';
import 'package:delivery_app/model/profile_model.dart';
import 'package:delivery_app/repository/data.dart';
import 'package:delivery_app/view/detial_Screen.dart';
import 'package:delivery_app/view/see_more_Screen.dart';
import 'package:delivery_app/view/tabScreen/cart_screen.dart';
import 'package:delivery_app/view/tabScreen/my_profile.dart';
import 'package:delivery_app/widget/resusable_home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

DataController _dataController = Get.find();
CartController _controller = Get.find();
AuthController _authController = Get.find();

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void initState() {
    super.initState();
    _dataController.tabcontroller =
        TabController(length: lstMainData.length, vsync: this);
    _dataController.tabcontroller.addListener(() {
      _dataController.updateCurrentIndex();
    });
    _controller.calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: lstMainData.length,
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        drawer: _buildDrower(context),
        // appBar: AppBar(),
        appBar: _buildAppBar(),

        body: _buildBody(),
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

  Widget _buildDrower(BuildContext context) {
    return Drawer(
      backgroundColor: bPrimaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 37,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 35, backgroundImage: AssetImage(profile)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Siem Polen",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "dvar4890@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          lineDrower(),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 30),
            physics: NeverScrollableScrollPhysics(),
            itemCount: lstofProfile.length,
            itemBuilder: (context, index) {
              final dataProfile = lstofProfile[index];
              return Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        index == 0 ? Get.to(() => MyProfile()) : null;
                      },
                      child: Row(
                        children: [
                          Icon(
                            dataProfile.icons,
                            size: 28,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            dataProfile.label.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 10, bottom: 10, right: 60),
                      child: index == lstofProfile.length - 1
                          ? null
                          : lineDrower(),
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 80),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      _authController.logout();
                    },
                    child: Text(
                      "Sign-out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Outfit',
                      ),
                    )),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
          lineDrower(),
        ],
      ),
    );
  }

  Padding _buildSeeMore() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Get.to(() => SeeMoreScreen()),
            child: Text(
              "See More",
              style: TextStyle(
                color: bPrimaryColor,
                fontSize: 16,
                fontFamily: 'Outfit',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Obx(
      () => Expanded(
        child: _buildSubTab(),
      ),
    );
  }

  Widget _buildSubTab() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20),
      itemCount: _dataController.homeList.length,
      itemBuilder: (context, index) {
        final getProduct = _dataController.homeList[index];
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
                      Get.to(
                        () => DetialScreen(
                          data: _dataController.homeList[index],
                        ),
                      );
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
                            spreadRadius: 2,
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
                              "${getProduct.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit',
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "\$ ${getProduct.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: bPrimaryColor,
                                fontFamily: 'Outfit'),
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
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          getProduct.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 50,
      child: TabBar(
        isScrollable: true,
        controller: _dataController.tabcontroller,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.only(left: 20),
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: bPrimaryColor),
          // insets: EdgeInsets.symmetric(horizontal: 55.0),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        tabs: lstMainData
            .map((e) => Text(
                  e.tabLabel!,
                  style: TextStyle(
                    color: bPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildBoxSerach() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30, bottom: 15),
      child: InkWell(
        onTap: () {
          Get.to(() => SeeMoreScreen());
        },
        child: Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                ),
              ),
              SizedBox(width: 15),
              Text(
                "Serach",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoHomeScreen() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLogoSerach(
            mainText: "Delicious",
            width: 50,
          ),
          SizedBox(height: 5),
          TextLogoSerach(
            mainText: "food for you",
            width: 45,
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blueGrey),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 13),
              child: InkWell(
                onTap: () {
                  Get.to(() => CartScreen());
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black54,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: 11,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: Colors.red,
                child: Obx(
                  () => Text(
                    "${_controller.totalOrderQty}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class lineDrower extends StatelessWidget {
  const lineDrower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
      child: Divider(
        color: Colors.white,
      ),
    );
  }
}
