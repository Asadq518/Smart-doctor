// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, annotate_overrides

import 'package:disease_prediction/app/modules/requirements/controllers/requirements_controller.dart';
import 'package:disease_prediction/app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../components/rounded_button.dart';
import '../../../../../../components/rounded_inputfield.dart';
import '../../../../dashboard/views/dashboard_view.dart';
import 'background.dart';

class RequirementsBody extends GetView<RequirementsController> {
  RequirementsBody({super.key});
  var controller = Get.put(RequirementsController());
  var namecontroller = TextEditingController();
  var agecontroller = TextEditingController();
  var bloodcontroller = TextEditingController();
  var previousDiseasecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RequirementsBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   'Requirements',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/doctor.svg',
              height: size.height * 0.35,
            ),
            RoundedInputField(
              controller: namecontroller,
              hintText: 'Name',
              onChanged: (value) {},
            ),
            RoundedInputField(
              controller: agecontroller,
              hintText: 'Age',
              
              icon: Icons.calendar_month_outlined,
              onChanged: (value) {},
            ),
            RoundedInputField(
              controller: bloodcontroller,
              icon: Icons.bloodtype,
              hintText: 'Blood Group',
              onChanged: (value) {},
            ),
            RoundedInputField(
              controller: TextEditingController(),
              icon: Icons.medical_services,
              hintText: 'Previous Disease',
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: const [
                  Text(
                    "Gender :",
                    style: TextStyle(
                        color: Colours.kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (controller.select.value) {
                            controller.select.value = false;
                          } else {
                            // if (!controller.selectButton.value) {
                            controller.selectButton.value = false;
                            controller.select.value = true;
                            // }
                          }
                        },
                        icon: Icon(Icons.person,
                            color: controller.select.value
                                ? Colors.black
                                : Colours.kPrimaryColor),
                      ),
                    ),
                    const Text("Male",
                        style: TextStyle(color: Colours.kPrimaryColor)),
                  ],
                ),
                Column(
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (controller.selectButton.value) {
                            controller.selectButton.value = false;
                          } else {
                            // if (!controller.select.value) {
                            controller.select.value = false;
                            controller.selectButton.value = true;
                            // }
                          }
                        },
                        icon: Icon(Icons.person_2,
                            color: controller.selectButton.value
                                ? Colors.black
                                : Colours.kPrimaryColor),
                      ),
                    ),
                    const Text(
                      "Female",
                      style: TextStyle(color: Colours.kPrimaryColor),
                    ),
                  ],
                ),
              ],
            ),
            RoundedButton(
                text: 'Next',
                press: () {
                  if (namecontroller.text.toString().isEmpty &&
                      agecontroller.text.toString().isEmpty &&
                      bloodcontroller.text.toString().isEmpty) {
                    Get.snackbar("failed", "All field are required");
                  } else {
                    Get.to(() => const DashboardView());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
