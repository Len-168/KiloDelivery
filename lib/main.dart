import 'package:delivery_app/view/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'binding/GetXBinding.dart';

void main() async {
  await GetStorage.init();
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: DeliveryBinding(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
    );
  }
}
