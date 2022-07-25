import 'package:codex/views/splash/controller/splashcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final splashScreenController = Get.put(SplashController());

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
                padding: EdgeInsets.only(top: _size.height / 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splashLogo.png',
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
                padding: EdgeInsets.only(top: _size.height / 3),
                child: InkWell(
                  onTap: () {
                    splashScreenController
                        .setScreen(FirebaseAuth.instance.currentUser);
                  },
                  child: Container(
                    width: _size.width / 2.5,
                    height: _size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.shade400,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _size.height / 60),
                child: Text(
                  'Developed With ❤️ By Sushant',
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
