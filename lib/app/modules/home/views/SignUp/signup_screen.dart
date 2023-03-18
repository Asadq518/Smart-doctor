import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../SignUp/components/body.dart';

class SignUpScreen extends GetView<HomeController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SignUpBody(),
    );
  }
}
