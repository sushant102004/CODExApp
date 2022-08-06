import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex/admin/views/adminpanel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';

class AdminController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  GlobalKey<FormState> createNewEventKey = GlobalKey<FormState>();

  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  late TextEditingController eventNameController,
      eventIntroController,
      eventDateController,
      eventTimingController,
      eventTeamSizeController,
      eventLocationController,
      eventLDORController,
      eventContactNumberOneController,
      eventContactNumberTwoController,
      eventRegisterationLinkController,
      eventDescriptionController;

  // New Event Details
  var eventPoster = ''.obs;
  var name = '';
  var intro = '';
  var date = '';
  var timing = '';
  var teamSize = '';
  var location = '';
  var ldor = '';
  var contactNumberOne = '';
  var contactNumberTwo = '';
  var registrationLink = '';
  var description = '';

  @override
  void onInit() {
    super.onInit();
    eventNameController = TextEditingController();
    eventIntroController = TextEditingController();
    eventDateController = TextEditingController();
    eventTimingController = TextEditingController();
    eventTeamSizeController = TextEditingController();
    eventLocationController = TextEditingController();
    eventLDORController = TextEditingController();
    eventContactNumberOneController = TextEditingController();
    eventContactNumberTwoController = TextEditingController();
    eventRegisterationLinkController = TextEditingController();
    eventDescriptionController = TextEditingController();
  }

  String? checkInputField(String value) {
    if (value.isEmpty) {
      return 'Please Fill This';
    }
    return null;
  }

  // Admin Login
  adminLogin() async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'admin@admin.com', password: adminPasswordController.text);

      Get.off(const AdminPanel());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return Get.snackbar('Something Went Wrong', 'Your Are Not Registered',
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
            duration: const Duration(seconds: 3),
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
      } else if (e.code == 'wrong-password') {
        return Get.snackbar('Something Went Wrong', 'Password Is Wrong',
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
            duration: const Duration(seconds: 3),
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // Image Selection Code
  var selectedImagePath = ''.obs;
  void pickPosterImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    } else {
      Get.snackbar('Something Went Wrong', 'You have not picked any image',
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
          ));
    }
  }

  // Upload Image to cloud storage
  Future<String> uploadEventPoster() async {
    Reference ref = storage.ref().child('posters').child(name);
    UploadTask uploadTask = ref.putFile(File(selectedImagePath.value));
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    eventPoster.value = downloadURL;
    return eventPoster.value;
  }

  // Add new event data to DB
  addNewEventDataToDB(
      String name,
      intro,
      date,
      timing,
      teamSize,
      location,
      ldor,
      contactNumber,
      alternateContactNumber,
      registrationLink,
      description,
      image) async {
    firestore.collection('events').doc(randomString(10)).set({
      'name': name,
      'intro': intro,
      'date': date,
      'teamSize': teamSize,
      'location': location,
      'lastDateOfRegistration': ldor,
      'contactNumberOne': contactNumber,
      'contactNumberTwo': alternateContactNumber,
      'registerLink': registrationLink,
      'isPastEvent': false,
      'image': image,
      'description': description,
      'timing': timing,
    });
  }

  addNewEvent() async {
    final isInputValid = createNewEventKey.currentState!.validate();
    if (!isInputValid) {
      return;
    }
    createNewEventKey.currentState!.save();
    await uploadEventPoster();
    await addNewEventDataToDB(
        name,
        intro,
        date,
        timing,
        teamSize,
        location,
        ldor,
        contactNumberOne,
        contactNumberTwo,
        registrationLink,
        description,
        eventPoster.value);
    Get.snackbar('Success', 'Event Created');
    Get.off(const AdminPanel());
  }
}
