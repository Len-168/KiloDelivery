// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/widget/TextField.dart';
import 'package:delivery_app/widget/TextStyle.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          _buildTabBar(),
          SizedBox(height: 7),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildLoginTab(),
          _buildSignUp(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      width: Get.width,
      height: Get.height / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(splashLogo),
              backgroundColor: Colors.white,
            ),
          ),
          Spacer(),
          Container(
            child: TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicatorWeight: 4,
              splashFactory: NoSplash.splashFactory,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5, color: bPrimaryColor),
                insets: EdgeInsets.symmetric(horizontal: 50.0),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              tabs: [
                Tab(
                  child: labelTab(label: "Login"),
                ),
                Tab(
                  child: labelTab(label: "Sign-Up"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginTab() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          TextFieldLable(labelText: "Email address"),
          TextFormFieldReuse(controller: authController.email),
          SizedBox(height: 20),
          TextFieldLable(labelText: "Password"),
          TextFormFieldReuse(
            icons: Icons.visibility_off_outlined,
            controller: authController.password,
          ),
          SizedBox(height: 15),
          HelperTextFiled(Label: "Forgot Password?"),
          Spacer(),
          InkWell(
            onTap: () {
              String email = authController.email.text;
              String password = authController.password.text;
              authController.login(email, password);
            },
            child: buttonApp(label: "Login"),
          ),
        ],
      ),
    ));
  }

  Widget _buildSignUp() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          TextFieldLable(labelText: "Username"),
          TextFormFieldReuse(controller: authController.username),
          SizedBox(height: 20),
          TextFieldLable(labelText: "Email address"),
          TextFormFieldReuse(
            controller: authController.email,
          ),
          SizedBox(height: 20),
          TextFieldLable(
            labelText: "Password",
          ),
          TextFormFieldReuse(
            icons: Icons.visibility_off_outlined,
          ),
          SizedBox(height: 15),
          HelperTextFiled(Label: "Alreay have an account?"),
          Spacer(),
          InkWell(
            onTap: () {
              String username = authController.username.text;
              String email = authController.email.text;
              String password = authController.password.text;
              authController.register(username, email, password);
            },
            child: buttonApp(label: "Sign Up"),
          ),
        ],
      ),
    ));
  }
}
