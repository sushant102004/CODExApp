import 'package:codex/views/authentication/views/authenticationpage.dart';
import 'package:codex/views/splash/view/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.jostTextTheme()),
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(
            name: '/authentication', page: () => const AuthenticationScreen())
      ],
      initialRoute: '/splash',
    );
  }
}
