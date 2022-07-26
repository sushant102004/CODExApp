import 'package:codex/views/splash/view/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  logout() async {
    FirebaseAuth.instance.signOut();
    Get.off(const SplashScreen());
  }
}
