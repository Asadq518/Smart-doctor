// ignore_for_file: unused_field, must_be_immutable, unused_local_variable, unnecessary_null_comparison, avoid_print

import 'package:disease_prediction/app/utils/contants.dart';
import 'package:disease_prediction/components/text_field_container.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../components/already_have_an_account_acheck.dart';
import '../../../../../../components/rounded_button.dart';
import '../../../../requirements/views/requirements_view.dart';
import '../../../controllers/home_controller.dart';
import '../../Signup/signup_screen.dart';
import 'background.dart';

class LoginBody extends GetView<HomeController> {
  LoginBody({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref().child("users");
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/doctor.svg',
              height: size.height * 0.35,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFieldContainer(
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colours.kPrimaryColor,
                            ),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          } else if (value.isEmail) {
                            return null;
                          } else {
                            return "Enter Valid Email";
                          }
                        }),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colours.kPrimaryColor,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colours.kPrimaryColor,
                          ),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            // RoundedInputField(
            //   hintText: 'Your Email',
            //   onChanged: (value) {},
            // ),
            // RoundedInputField(
            //   hintText: 'Password',
            //   obscureText: true,
            //   icon: Icons.lock,
            //   onChanged: (value) {},
            // ),
            RoundedButton(
                text: 'LOGIN',
                press: () async {
                  if (formKey.currentState!.validate()) {
                    print('wow123 valid');

                    await databaseReference.once().then((value) async {
                      print('wow123 call');

                      for (var e in value.snapshot.children) {
                        Map<dynamic, dynamic>? values = e.value as Map?;
                        // print();
                        if (values!['email'] ==
                                emailController.text.toString() &&
                            values['password'] ==
                                passwordController.text.toString()) {
                          print(e.key);
                          // print("Success");
                          Get.snackbar("Success", "");
                          await controller.storage
                              .write(key: 'key', value: e.key.toString());
                          await controller.storage.write(
                              key: 'name', value: values['name'].toString());
                          await controller.storage.write(
                              key: 'password',
                              value: values['password'].toString());
                          await controller.storage.write(
                              key: 'email', value: values['email'].toString());
                          await controller.storage.write(
                              key: 'age', value: values['age'].toString());
                          await controller.storage.write(
                              key: 'gender',
                              value: values['gender'].toString());

                          Get.offAll(const RequirementsView());
                        }
                      }
                      // print('Data : ${value.snapshot.children.f}');
                    }).onError((error, stackTrace) {
                      print(error);
                    });
                    String? value = await controller.storage.read(key: "key");
                    if (value == null) {
                      Get.snackbar("failed", "Check your email and password");
                    }
                  }
                }),
            AlreadyHaveAnAccountCheck(
              press: () {
                Get.off(() => const SignUpScreen());
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return const SignUpScreen();
                //   }),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}

class UserModel {
  UserModel(this.email);
  final String email;
}
