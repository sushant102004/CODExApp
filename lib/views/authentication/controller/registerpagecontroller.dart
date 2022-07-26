import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex/views/home/views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController nameController,
      emailController,
      passwordController,
      rollNoController,
      phoneController,
      streamController;

  var name = '';
  var email = '';
  var password = '';
  var rollNo = '';
  var phone = '';
  var stream = '';

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rollNoController = TextEditingController();
    phoneController = TextEditingController();
    streamController = TextEditingController();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please Provide Valid Email';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.length < 4) {
      return 'Please Enter Your Name';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (GetUtils.isNull(value) || value.length < 6) {
      return 'Please A Password More Then 6 Alphabets';
    }
    return null;
  }

  String? validateRollNo(String value) {
    if (value.isEmpty || GetUtils.isAlphabetOnly(value) || value.length < 8) {
      return 'Please Enter Valid Roll No';
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Batch';
    }
    return null;
  }

  String? validateStream(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Stream';
    }
    return null;
  }

  register() async {
    final isInputValid = registerFormKey.currentState!.validate();
    if (!isInputValid) {
      return;
    }
    registerFormKey.currentState!.save();

    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      addDataToDB(name, email, rollNo, phone, stream);
      Get.off(const HomePage());
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return Get.snackbar(
            'Something Went Wrong', 'Please Enter Strong Password',
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
            duration: const Duration(seconds: 3),
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
      } else if (e.code == 'email-already-in-use') {
        return Get.snackbar('Something Went Wrong', 'Email Already Registered',
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

  addDataToDB(String name, email, rollNo, phone, stream) async {
    final User user = auth.currentUser!;
    firestore
        .collection('users')
        .doc(user.uid)
        .set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'rollNo': rollNo,
          'phone': phone,
          'stream': stream,
        })
        .then((value) => print('User Created & Data Added To DB'))
        .catchError((err) => print('Error: $err'));
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rollNoController.dispose();
    phoneController.dispose();
    streamController.dispose();
  }
}
