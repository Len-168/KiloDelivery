import 'package:delivery_app/controller/splashController.dart';
import 'package:delivery_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController sh = Get.find();

  void initState() {
    sh.intiSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: Get.width,
      height: Get.height,
      color: bPrimaryColor,
      child: Stack(
        children: [
          _buildLogo(),
          _buildRitgtImage(),
          _bulidLeftImage(),
          _buildGradientColor(),
          _buildButton(),
        ],
      ),
    );
  }

  Positioned _bulidLeftImage() {
    return Positioned(
      bottom: 70,
      left: 0,
      child: Image.asset(splashGirl, height: 400),
    );
  }

  Positioned _buildRitgtImage() {
    return Positioned(
      bottom: 95,
      right: 0,
      child: Image.asset(splashBoy),
    );
  }

  Widget _buildButton() {
    return Positioned(
      bottom: 30,
      left: 40,
      right: 40,
      child: Container(
        width: 260,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              color: bPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientColor() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 400,
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffff4b3a),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.2, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 60),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(splashLogo),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 35),
          child: Image.asset(
            splashText,
            height: 90,
          ),
        ),
      ],
    );
  }
}
