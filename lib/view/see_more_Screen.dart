// ignore_for_file: must_be_immutable
import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/seemore_controller.dart';
import 'package:delivery_app/view/detial_Screen.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SeeMoreScreen extends StatelessWidget {
  SeeMoreScreen({super.key});

  SeemoreController _dataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: ReuseAppBar(
        leading: Icons.arrow_back_ios_new,
      ),
      body: _buildBody(),
    );
  }

  ListView _buildBody() {
    return ListView(
      children: [
        _buildShowData(),
      ],
    );
  }

  Obx _buildShowData() {
    return Obx(
      () => StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: _dataController.seemoreList.length,
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, 1.6);
        },
        itemBuilder: (context, index) {
          final _getProduct = _dataController.seemoreList[index];
          return InkWell(
            onTap: () {
              Get.to(
                () => DetialScreen(
                  data: _dataController.seemoreList[index],
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                top: index % 2 == 0 ? 0 : 40,
                bottom: index % 2 == 0 ? 40 : 0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  // color: Colors.amber,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Spacer(),
                          Container(
                            width: double.infinity,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 110),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Text(
                                    "${_getProduct.title}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 15),
                                  child: Text(
                                    "\$ ${_getProduct.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: bPrimaryColor,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 2,
                        child: Center(
                          child: Container(
                            width: 135,
                            height: 135,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: AssetImage(
                                    _getProduct.image.toString(),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
