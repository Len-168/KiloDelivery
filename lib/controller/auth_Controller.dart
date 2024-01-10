import 'package:delivery_app/model/auth_model.dart';
import 'package:delivery_app/view/authScreen/login_Screen.dart';
import 'package:delivery_app/view/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  Rx<User> user = User(email: "", password: "").obs;
  RxBool showPassword = true.obs;

  late TabController tabcontroller;
  RxInt currentIndex = 0.obs;

  final Remail = TextEditingController(text: "hello123");
  final Rpassword = TextEditingController();
  final Rusername = TextEditingController();
  final Lemail = TextEditingController(text: "hello123");
  final Lpassword = TextEditingController();

  void register(String username, String email, String password) async {
    user.value = User(email: email, password: password);
    box.write('user', {'email': email, 'password': password});
    Get.snackbar("Succes", "Register success");
    Rusername.clear();
    Remail.clear();
    Rpassword.clear();
    tabcontroller.animateTo(0);
  }

  void login(String email, String password) async {
    final getUser = box.read('user');
    if (email == getUser?['email'] && password == getUser?['password']) {
      Get.offAll(() => NavigationScreen());
      box.write('isLogin', true);
      Lemail.clear();
      Lpassword.clear();
    } else {
      Get.snackbar("Error", "No Account");
    }
  }

  void logout() async {
    box.remove('isLogin');
    Get.offAll(LoginScreen());
  }

  bool isLogin() {
    return box.read('isLogin') ?? false;
  }

  void showHidePass() {
    showPassword.value = !showPassword.value;
  }

  void updateCurrentIndex() {
    currentIndex(tabcontroller.index);
  }
}
