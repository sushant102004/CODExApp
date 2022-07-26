import 'package:codex/views/home/views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please Enter Your Email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Password';
    }
    return null;
  }

  login() async {
    final isInputValid = loginKey.currentState!.validate();
    if (!isInputValid) {
      return;
    }
    loginKey.currentState!.save();

    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Get.off(const HomePage());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return Get.snackbar('Something Went Wrong', 'Your Are Not Registered',
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
            duration: const Duration(seconds: 3),
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
      } else if (e.code == 'wrong-password') {
        return Get.snackbar('Something Went Wrong', 'Password Is Wrong',
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
            duration: const Duration(seconds: 3),
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
