// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, unrelated_type_equality_checks, deprecated_member_use
import 'package:disease_prediction/app/modules/home/views/Login/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../components/already_have_an_account_acheck.dart';
import '../../../../../../components/rounded_button.dart';
import '../../../../../../components/text_field_container.dart';
import '../../../../../utils/contants.dart';
import '../../../controllers/home_controller.dart';

class SignUpBody extends GetView<HomeController> {
  SignUpBody({super.key});
  final _formkey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref().child("users");
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: size.height * 0.02),
      SvgPicture.asset(
        'assets/icons/doctor.svg',
        height: size.height * 0.25,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFieldContainer(
                      child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          decoration: const InputDecoration(
                              hintText: "User Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colours.kPrimaryColor,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your user name";
                            }
                            return null;
                          }),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
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
                          keyboardType: TextInputType.number,
                          controller: controller.ageController,
                          decoration: const InputDecoration(
                              hintText: "Age",
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: Colours.kPrimaryColor,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Age";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controller.genderController,
                          decoration: const InputDecoration(
                              hintText: "Gender",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colours.kPrimaryColor,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Gender";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        // obscureText: true,
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colours.kPrimaryColor,
                            ),
                            // suffixIcon: Icon(
                            //   Icons.visibility,
                            //   color: Colours.kPrimaryColor,
                            // ),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        // obscureText: true,
                        controller: controller.confirmPasswordController,
                        decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colours.kPrimaryColor,
                            ),
                            // suffixIcon: Icon(
                            //   Icons.visibility,
                            //   color: Colours.kPrimaryColor,
                            // ),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Confirm Password";
                          } else if (value !=
                              controller.passwordController.text) {
                            return "password do not match";
                          } else if (value ==
                              controller.passwordController.text) {
                            return null;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                  text: 'SignUp',
                  press: () {
                    if (_formkey.currentState!.validate()) {
                      databaseReference
                          .child(databaseReference.push().key.toString())
                          .set({
                        'name': controller.nameController.text.toString(),
                        'email': controller.emailController.text.toString(),
                        'password':
                            controller.passwordController.text.toString(),
                        'age': controller.ageController.text.toString(),
                        'gender': controller.genderController.text.toString(),
                      }).whenComplete(() => {
                                Get.snackbar("Signup Successfully", ''),
                                controller.nameController.text = '',
                                controller.emailController.text = '',
                                controller.passwordController.text = '',
                                controller.ageController.text = '',
                                controller.genderController.text = '',
                                controller.confirmPasswordController.text = '',
                              });
                      // _auth.createUserWithEmailAndPassword(
                      //   email: controller.emailController.text.toString(),
                      //   password: controller.passwordController.text.toString(),
                      // );
                      // Get.off(const RequirementsView());
                    } else {
                      Get.snackbar("Failed", "Failed To SignUp");
                    }
                  }),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.off(const LoginScreen());
                  //Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return SignUpScreen();
                  //   }),
                  // )
                },
              ),
              const SizedBox(
                height: 20,
              ), // const OrDivider(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SocialIcon(
              //       iconSrc: 'assets/icons/facebook.svg',
              //       press: () {},
              //     ),
              //     SocialIcon(
              //       iconSrc: 'assets/icons/twitter.svg',
              //       press: () {},
              //     ),
              //     SocialIcon(
              //       iconSrc: 'assets/icons/google-plus.svg',
              //       press: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    ]);
  }
}
