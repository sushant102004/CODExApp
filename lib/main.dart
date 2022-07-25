import 'package:codex/firebase_options.dart';
import 'package:codex/views/authentication/views/registerpage.dart';
import 'package:codex/views/home/views/homepage.dart';
import 'package:codex/views/splash/view/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        GetPage(name: '/register', page: () => const AuthenticationScreen()),
        GetPage(name: '/home', page: () => const HomePage())
      ],
      initialRoute: '/splash',
    );
  }
}
