import 'package:delivery_app/view/authScreen/login_Screen.dart';
import 'package:delivery_app/view/homeScren.dart';
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
      debugShowCheckedModeBanner: false,
      initialBinding: DeliveryBinding(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
