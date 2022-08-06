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
            child: Form(
              key: adminController.createNewEventKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    // ignore: unrelated_type_equality_checks
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
                                      color: Colors.grey.shade500,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          )
                        : Image.file(
                            File(adminController.selectedImagePath.value))),
                  ),
                  InputField(
                      hintText: 'Event Name',
                      textController: adminController.eventNameController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.name = value!;
                      }),
                  InputField(
                      hintText: 'Date',
                      textController: adminController.eventDateController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.date = value!;
                      }),
                  InputField(
                      hintText: 'Timing',
                      textController: adminController.eventTimingController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.timing = value!;
                      }),
                  InputField(
                      hintText: 'Team Size',
                      textController: adminController.eventTeamSizeController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.teamSize = value!;
                      }),
                  InputField(
                      hintText: 'Location',
                      textController: adminController.eventLocationController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.location = value!;
                      }),
                  InputField(
                      hintText: 'Last date of registration',
                      textController: adminController.eventLDORController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.ldor = value!;
                      }),
                  InputField(
                      hintText: 'Contact Number',
                      textController:
                          adminController.eventContactNumberOneController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.contactNumberOne = value!;
                      }),
                  InputField(
                      hintText: 'Alternate Contact Number',
                      textController:
                          adminController.eventContactNumberTwoController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.contactNumberTwo = value!;
                      }),
                  InputField(
                      hintText: 'Registration Link',
                      textController:
                          adminController.eventRegisterationLinkController,
                      validate: (value) {
                        return adminController.checkInputField(value!);
                      },
                      onSaved: (value) {
                        adminController.registrationLink = value!;
                      }),
                  SizedBox(
                    height: _size.height / 50,
                  ),
                  TextFormField(
                    maxLines: 5,
                    minLines: 3,
                    decoration: InputDecoration(
                        hintText: 'Intro',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    controller: adminController.eventIntroController,
                    validator: (value) {
                      return adminController.checkInputField(value!);
                    },
                    onSaved: (value) {
                      adminController.intro = value!;
                    },
                  ),
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
                    controller: adminController.eventDescriptionController,
                    validator: (value) {
                      return adminController.checkInputField(value!);
                    },
                    onSaved: (value) {
                      adminController.description = value!;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        adminController.addNewEvent();
                      },
                      child: const Text('Create Event'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.hintText,
      required this.textController,
      required this.onSaved,
      required this.validate})
      : super(key: key);
  final String hintText;
  final TextEditingController textController;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: _size.height / 50),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        controller: textController,
        onSaved: onSaved,
        validator: validate,
      ),
    );
  }
}
