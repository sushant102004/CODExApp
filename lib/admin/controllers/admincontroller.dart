import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex/admin/views/adminpanel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminController extends GetxController {
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  adminLogin() async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'admin@admin.com', password: adminPasswordController.text);

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

  var selectedImagePath = ''.obs;
  void pickPosterImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    } else {
      Get.snackbar('Something Went Wrong', 'You have not picked any image',
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
          ));
    }
  }
}
