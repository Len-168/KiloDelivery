import 'dart:async';

import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/view/authScreen/login_Screen.dart';
import 'package:delivery_app/view/tabScreen/home_Screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late Timer? _timer;

  void intiSplashScreen() async {
    AuthController authController = Get.find();

    _timer = Timer(
      Duration(seconds: 3),
      () => authController.isLogin()
          ? Get.offAll(() => HomeScreen())
          : Get.offAll(() => LoginScreen()),
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
