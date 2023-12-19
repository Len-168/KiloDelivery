import 'package:delivery_app/controller/splashController.dart';
import 'package:get/get.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
