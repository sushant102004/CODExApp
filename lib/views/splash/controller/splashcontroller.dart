import 'dart:async';

import 'package:get/get.dart';

class SplashController {
  goToAuthentication() {
    printInfo(info: 'Navigated');
    Get.toNamed('/register');
  }
}
