import 'package:delivery_app/widget/login_Screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void intiSplashScreen() async {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAll(() => LoginScreen());
      },
    );
  }
}