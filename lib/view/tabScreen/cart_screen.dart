import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/widget/AppBar_Reusable.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bAppColor,
      appBar: ReuseAppBar(
        leading: Icons.arrow_back_ios_new,
        title: "Cart",
      ),
      floatingActionButton: buttonApp(
        label: 'Complect Order',
        Right: 30,
        Left: 30,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: _buildBody(),
    );
  }

  ListView _buildBody() {
    return ListView(
      children: [
        _buildGuySwipe(),
        _buildListCart(),
      ],
    );
  }

  Widget _buildListCart() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Slidable(
              endActionPane: ActionPane(
                motion: BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.green,
                    icon: Icons.favorite_border_outlined,
                    autoClose: true,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SlidableAction(
                    onPressed: (context) {},
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 13),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              'assets/image/pizza/5.png',
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Coca Cola",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Outfit',
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "\$ 100",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Outfit',
                                  color: bPrimaryColor,
                                ),
                              ),
                              SizedBox(width: 100),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: bPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    bottom: 5,
                                    top: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "-",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
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
