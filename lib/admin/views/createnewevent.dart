import 'dart:io';

import 'package:codex/admin/controllers/admincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewEvent extends StatefulWidget {
  const CreateNewEvent({Key? key}) : super(key: key);

  @override
  State<CreateNewEvent> createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final adminController = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'Create New Event',
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              adminController.pickPosterImage();
            },
            child: Column(
              children: [
                Container(
                  height: _size.height / 3,
                  width: _size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Obx(() => adminController.selectedImagePath == ''
                      ? Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(
                                width: _size.width / 35,
                              ),
                              Text(
                                'Pick Poster Image',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 18),
                              )
                            ],
                          ),
                        )
                      : Image.file(
                          File(adminController.selectedImagePath.value))),
                ),
                InputField(hintText: 'Event Name'),
                InputField(hintText: 'Date'),
                InputField(hintText: 'Timing'),
                InputField(hintText: 'Team Size'),
                InputField(hintText: 'Location'),
                InputField(hintText: 'Last date of registration'),
                InputField(hintText: 'Contact Numbers'),
                InputField(hintText: 'Registration Link'),
                SizedBox(
                  height: _size.height / 50,
                ),
                TextFormField(
                  maxLines: 100,
                  minLines: 10,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Create Event'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.hintText}) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: _size.height / 50),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}


// Backup

/*

Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          width: _size.width / 35,
                        ),
                        Text(
                          'Pick Poster Image',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 18),
                        )
                      ],
                    ),
                  ),

*/