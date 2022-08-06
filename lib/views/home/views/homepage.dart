import 'package:codex/admin/controllers/admincontroller.dart';
import 'package:codex/admin/views/adminlogin.dart';
import 'package:codex/views/home/controllers/homecontroller.dart';
import 'package:codex/views/home/views/upcomingevents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'CODEx',
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image.asset('assets/images/codexLogo.jpg',
                width: _size.width / 1.3),
            Padding(
              padding: EdgeInsets.only(
                top: _size.height / 20,
                left: _size.width / 30,
                right: _size.width / 30,
              ),
              child: const Text(
                'CODEx - Community of Developers is a technical club which provide platform for students to enhance their skills in technical field.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _size.height / 1.63),
              child: InkWell(
                onTap: () {
                  Get.to(const AdminLogin());
                },
                child: const Text(
                  'Login As Admin',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent.shade400,
        items: const [
          BottomNavigationBarItem(
            label: 'Events',
            icon: Icon(Icons.event_available),
          ),
          BottomNavigationBarItem(
            label: 'Past Events',
            icon: Icon(Icons.event_repeat_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: const UpcomingEvents(),
    );
  }
}
