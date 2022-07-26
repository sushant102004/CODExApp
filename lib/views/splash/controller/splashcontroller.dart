import 'package:codex/views/authentication/views/registerpage.dart';
import 'package:codex/views/home/views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController {
  setScreen(User? user) {
    if (user == null) {
      Get.off(const AuthenticationScreen());
    } else {
      Get.off(const HomePage());
    }
  }
}
