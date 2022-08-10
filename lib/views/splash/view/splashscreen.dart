import 'dart:async';
import 'package:codex/views/splash/controller/splashcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());
  @override
  void initState() {
    super.initState();
    setScreen();
  }

  setScreen() async {
    Timer(const Duration(seconds: 2), () {
      splashController.setScreen(FirebaseAuth.instance.currentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: _size.height,
          width: _size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: _size.height / 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splashLogoTwo.png',
                      width: _size.width,
                    )
                  ],
                ),
              ),
              const Text(
                'CODEx',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Community of Developers',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.only(top: _size.height / 6),
                child: Image.asset(
                  'assets/images/loadingBar.gif',
                  width: 120,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _size.height / 60),
                child: Text(
                  '© Copyright CODEx 2022',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
