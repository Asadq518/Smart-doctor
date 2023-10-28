// ignore_for_file: unnecessary_overrides
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class RequirementsController extends GetxController {
  // ignore: todo
  //TODO: Implement RequirementsController
  // RxBool formField = false.obs;

  RxBool click = true.obs;

  var select = false.obs;
  var selectButton = false.obs;

  var email = ''.obs;
  var name = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;

  final storage = const FlutterSecureStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    await storage.read(key: 'email').then((value) => email.value = value!);
    await storage.read(key: 'name').then((value) => name.value = value!);
    await storage.read(key: 'age').then((value) => age.value = value!);
    await storage.read(key: 'gender').then((value) => gender.value = value!);
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
