import 'package:delivery_app/view/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/GetXBinding.dart';

void main() {
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DeliveryBinding(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
