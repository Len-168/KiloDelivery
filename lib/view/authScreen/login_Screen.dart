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

  AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildTabBar(),
        SizedBox(height: 7),
        _buildTabBarView(),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: Obx(
        () => TabBarView(
          children: [
            _buildLoginTab(),
            _buildSignUp(),
          ],
        ),
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
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: ListView(
        children: [
          SizedBox(height: 30),
          TextFieldLable(labelText: "Email address"),
          TextFormFieldReuse(
            controller: _authController.Lemail,
          ),
          SizedBox(height: 20),
          TextFieldLable(labelText: "Password"),
          TextFormFieldReuse(
            onPressedFunction: () {
              _authController.showHidePass();
            },
            icons: _authController.showPassword.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            controller: _authController.Lpassword,
            obscureText: _authController.showPassword.value,
          ),
          SizedBox(height: 15),
          HelperTextFiled(Label: "Forgot Password?"),
          SizedBox(height: 70),
          InkWell(
            onTap: () {
              String email = _authController.Lemail.text;
              String password = _authController.Lpassword.text;
              _authController.login(email, password);
            },
            child: buttonApp(
              label: "Login",
              Left: 0,
              Right: 0,
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildSignUp() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: ListView(
        children: [
          SizedBox(height: 30),
          TextFieldLable(labelText: "Username"),
          TextFormFieldReuse(
            controller: _authController.Rusername,
          ),
          SizedBox(height: 20),
          TextFieldLable(labelText: "Email address"),
          TextFormFieldReuse(
            controller: _authController.Remail,
          ),
          SizedBox(height: 20),
          TextFieldLable(
            labelText: "Password",
          ),
          TextFormFieldReuse(
            onPressedFunction: () {
              _authController.showHidePass();
            },
            icons: _authController.showPassword.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            controller: _authController.Rpassword,
            obscureText: _authController.showPassword.value,
          ),
          SizedBox(height: 15),
          HelperTextFiled(Label: "Alreay have an account?"),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              String username = _authController.Rpassword.text.trim();
              String email = _authController.Remail.text.trim();
              String password = _authController.Rpassword.text.trim();
              _authController.register(username, email, password);
            },
            child: buttonApp(label: "Sign Up", Left: 0, Right: 0),
          ),
        ],
      ),
    ));
  }
}
