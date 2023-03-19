// ignore_for_file: unused_import, unused_field

import 'package:body_part_selector/body_part_selector.dart';
import 'package:disease_prediction/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../requirements/views/requirements_view.dart';

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
    // TODO: implement onInit
    super.onInit();
    String? value = await storage.read(key: "key");
    if (value != null) {
      Get.offNamed(Routes.REQUIREMENTS);
    }
  }
}
