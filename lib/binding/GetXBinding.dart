import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/controller/splash_Controller.dart';
import 'package:get/get.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(AuthController());
  }
}
