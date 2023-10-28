// ignore_for_file: unused_import, unused_field

import 'package:body_part_selector/body_part_selector.dart';
import 'package:disease_prediction/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../requirements/views/requirements_view.dart';
// import 'dart:async';

class HomeController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    // timerMethod();
 
  }

  // var timer = false.obs;
  // Future<void> timerMethod() async {
  //   await Future.delayed(const Duration(milliseconds: 200), () {
  //     timer.value = true;
  //   });
  // }
}
