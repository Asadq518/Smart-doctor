// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../components/rounded_button.dart';
import '../../../../../utils/contants.dart';
import '../../../controllers/home_controller.dart';
import '../../Login/login_screen.dart';
import '../../SignUp/signup_screen.dart';
import 'background.dart';

class Body extends GetView<HomeController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'WELCOME TO SMART DOCTOR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/doctor.svg',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'Login',
              press: () {
                Get.to(()=>const LoginScreen());
              },
            ),
            RoundedButton(
              text: 'SignUP',
              textColor: Colours.kPrimaryColor,
              color: Colours.kPrimaryLightColor,
              press: () {
                Get.to(()=>const SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
