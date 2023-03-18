// ignore_for_file: unnecessary_overrides
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class RequirementsController extends GetxController {
  // ignore: todo
  //TODO: Implement RequirementsController
  // RxBool formField = false.obs;

  RxBool click = true.obs;
  // TextEditingController nameController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  // TextEditingController bloodController = TextEditingController();

  var select = false.obs;
  var selectButton = false.obs;
  var email = ''.obs;
  var name = ''.obs;

final storage =  FlutterSecureStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    await storage.read(key: 'email').then((value) => email.value=value!);
    await storage.read(key: 'name').then((value) => name.value=value!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
