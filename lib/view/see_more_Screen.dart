// ignore_for_file: must_be_immutable
import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/seemore_controller.dart';
import 'package:delivery_app/view/detial_Screen.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            Future.delayed(Duration(milliseconds: 250), () {
              Get.back();
            });
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Container(
          width: 250,
          height: 50,
          child: TextFormField(
            onChanged: (value) => _dataController.searchByTitle(value),
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
            decoration: InputDecoration(
              hintText: "Serach",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => ListView(
        children: [
          _dataController.serachResult.isEmpty
              ? _buildNotResult()
              : _buildAllDataSeeMore(),
          // _buildNotResult()
        ],
      ),
    );
  }

  Row _buildNotResult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Image.asset(SerachIcons),
              Text(
                "Item not Found",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text("Try searching the item with"),
              Text(" different keyword"),
            ],
          ),
        ),
      ],
    );
  }

  Obx _buildAllDataSeeMore() {
    return Obx(
      () => StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: _dataController.serachResult.length,
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, 1.6);
        },
        itemBuilder: (context, index) {
          final _getProduct = _dataController.serachResult[index];
          return InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              Future.delayed(Duration(milliseconds: 250), () {
                Get.to(
                  () => DetialScreen(
                    data: _dataController.serachResult[index],
                  ),
                );
              });
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
