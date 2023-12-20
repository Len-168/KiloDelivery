import 'package:delivery_app/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  RxBool isLogin = false.obs;
  Rx<User> user = User(email: "", password: "").obs;

  final Remail = TextEditingController();
  final Rpassword = TextEditingController();
  final Rusername = TextEditingController();
  final Lemail = TextEditingController();
  final Lpassword = TextEditingController();

  void register(String username, String email, String password) async {
    isLogin(true);
    user.value = User(email: email, password: password);
    box.write('isLogin', true);
    box.write('user', {'email': email, 'password': password});
  }

  void login(String email, String password) async {
    isLogin.value = true;
    final getUser = box.read('user');
    if (email == getUser?['email'] && password == getUser?['password']) {
      Get.offAllNamed('/home');
    }
  }

  void onInit() {
    super.onInit();
    isLogin.value = box.read('isLogin') ?? false;
    final getUser = box.read('user');
    if (getUser != null) {
      user.value = User(email: getUser['email'], password: getUser['password']);
    }
  }
}
