import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/view/authScreen/login_Screen.dart';
import 'package:delivery_app/view/tabScreen/home_Screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void intiSplashScreen() async {
    AuthController authController = Get.find();
    Future.delayed(
      Duration(seconds: 3),
      () => authController.isLogin.value
          ? Get.offAll(() => HomeScreen())
          : Get.offAll(() => LoginScreen()),
    );
  }
}
