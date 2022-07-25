import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController {
  goToAuthentication() {
    printInfo(info: 'Navigated');
    Get.toNamed('/register');
  }

  setScreen(User? user) {
    if (user == null) {
      Get.toNamed('/register');
    } else {
      Get.toNamed('/home');
    }
  }
}
