// ignore_for_file: override_on_non_overriding_member

import 'package:get/get.dart';

import '../controllers/requirements_controller.dart';

class RequirementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequirementsController>(
      () => RequirementsController(),
    );
  }
}
