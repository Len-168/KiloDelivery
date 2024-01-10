// ignore_for_file: must_be_immutable

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/widget/TextField.dart';
import 'package:delivery_app/widget/TextStyle.dart';
import 'package:delivery_app/widget/buttonStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AuthController _authController = Get.find();
  final _formKeyLogin = GlobalKey<FormState>();
  final _formKeySigup = GlobalKey<FormState>();
  @override
  void initState() {
    _authController.tabcontroller = TabController(length: 2, vsync: this);
    _authController.tabcontroller.addListener(() {
      _authController.updateCurrentIndex();
    });
    super.initState();
  }

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
          controller: _authController.tabcontroller,
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
              controller: _authController.tabcontroller,
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
    return Form(
      key: _formKeyLogin,
      child: Container(
          child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: ListView(
          children: [
            SizedBox(height: 10),
            TextFieldLable(labelText: "Email address"),
            TextFormFieldReuse(
              controller: _authController.Lemail,
              validator: (value) {
                if (value == null || value.isEmail) {
                  return null;
                }
                return 'Invalid email';
              },
            ),
            SizedBox(height: 15),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "invalid password";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            HelperTextFiled(Label: "Forgot Password?"),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                if (_formKeyLogin.currentState!.validate()) {
                  _authController.login(
                    _authController.Lemail.text.trim(),
                    _authController.Lpassword.text,
                  );
                }
              },
              child: buttonApp(
                label: "Login",
                Left: 0,
                Right: 0,
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildSignUp() {
    return Form(
      key: _formKeySigup,
      child: Container(
          child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: ListView(
          children: [
            SizedBox(height: 10),
            TextFieldLable(labelText: "Username"),
            TextFormFieldReuse(
              controller: _authController.Rusername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "username is required";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFieldLable(labelText: "Email address"),
            TextFormFieldReuse(
              controller: _authController.Remail,
              validator: (value) {
                if (value == null || value.isEmail) {
                  return null;
                }
                return 'Invalid email';
              },
            ),
            SizedBox(height: 15),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid password';
                }
                // else if (value.split(" ").length <= 8) {
                //   return 'Password must be at least 8 characters long.';
                // }
                return null;
              },
            ),
            SizedBox(height: 15),
            HelperTextFiled(Label: "Alreay have an account?"),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                if (_formKeySigup.currentState!.validate()) {
                  _authController.register(
                    _authController.Rusername.text.trim(),
                    _authController.Remail.text.trim(),
                    _authController.Rpassword.text.trim(),
                  );
                }
              },
              child: buttonApp(label: "Sign Up", Left: 0, Right: 0),
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
