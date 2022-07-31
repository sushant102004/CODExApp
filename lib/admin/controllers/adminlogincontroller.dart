import 'package:codex/admin/views/adminlogin.dart';
import 'package:codex/admin/views/adminpanel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  adminLogin() async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'admin@codex.in', password: adminPasswordController.text);

      Get.off(const AdminPanel());
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
}
