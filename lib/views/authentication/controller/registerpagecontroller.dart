import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      passwordController,
      rollNoController,
      batchController,
      streamController;

  var name = '';
  var email = '';
  var password = '';
  var rollNo = '';
  var batch = '';
  var stream = '';

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rollNoController = TextEditingController();
    batchController = TextEditingController();
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

  String? validateBatch(String value) {
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

  register() {
    final isInputValid = registerFormKey.currentState!.validate();
    if (!isInputValid) {
      return;
    }
    registerFormKey.currentState!.save();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rollNoController.dispose();
    batchController.dispose();
    streamController.dispose();
  }
}
