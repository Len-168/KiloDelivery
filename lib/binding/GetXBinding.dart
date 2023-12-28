import 'package:delivery_app/controller/auth_Controller.dart';
import 'package:delivery_app/controller/data_controller.dart';
import 'package:delivery_app/controller/seemore_controller.dart';
import 'package:delivery_app/controller/splash_Controller.dart';
import 'package:get/get.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(SplashController());
    Get.put(DataController());
    Get.put(SeemoreController());
  }
}
