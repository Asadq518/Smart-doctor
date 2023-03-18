// ignore_for_file: must_be_immutable, annotate_overrides, avoid_print

import 'dart:async';
import 'package:body_part_selector/body_part_selector.dart';
import 'package:disease_prediction/app/modules/dashboard/views/select_symptoms_view.dart';
import 'package:disease_prediction/app/utils/contants.dart';
import 'package:disease_prediction/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     padding: const EdgeInsets.all(0),
      //     children: const [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colours.kPrimaryColor,
      //         ), //BoxDecoration
      //         child: UserAccountsDrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Colours.kPrimaryColor,
      //           ),
      //           accountName: Text(
      //             "Abhishek Mishra",
      //             style: TextStyle(fontSize: 18),
      //           ),
      //           accountEmail: Text("abhishekm977@gmail.com"),
      //           currentAccountPictureSize: Size.square(50),
      //           currentAccountPicture: CircleAvatar(
      //             backgroundColor: Colors.white24,
      //             child: Text(
      //               "A",
      //               style: TextStyle(fontSize: 30.0, color: Colors.black),
      //             ), //Text
      //           ), //circleAvatar
      //         ), //UserAccountDrawerHeader
      //       ), //DrawerHeader
      // ListTile(
      //   leading: const Icon(Icons.person),
      //   title: const Text(' My Profile '),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // ListTile(
      //   leading: const Icon(Icons.book),
      //   title: const Text(' My Course '),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // ListTile(
      //   leading: const Icon(Icons.workspace_premium),
      //   title: const Text(' Go Premium '),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // ListTile(
      //   leading: const Icon(Icons.video_label),
      //   title: const Text(' Saved Videos '),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // ListTile(
      //   leading: const Icon(Icons.edit),
      //   title: const Text(' Edit Profile '),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // ListTile(
      //   leading: const Icon(Icons.logout),
      //   title: const Text('LogOut'),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: const CircleAvatar(
          backgroundColor: Colors.white24,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Image.asset('assets/images/bck.png'),
            ),
            const SizedBox(height: defaultPadding * 2),
            Center(
              child: RoundedButton(
                  text: "Check symptoms",
                  press: () {
                    Get.to(() => BodySelectorView());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class BodySelectorView extends GetView<DashboardController> {
  BodySelectorView({Key? key}) : super(key: key);
  var controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts Selector'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Select your body part",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: BodyPartSelectorTurnable(
                  mirrored: false,
                  bodyParts: controller.bodyParts.value,
                  onSelectionUpdated: (p) {
                    controller.bodyParts.value = p;
                    print(p);
                    Timer(const Duration(milliseconds: 100), () {
                      controller.bodyParts.value = const BodyParts();
                      Get.to(() => const SelectSymptomsView(), arguments: p);
                    });
                  },
                  labelData: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:async';
// import 'package:body_part_selector/body_part_selector.dart';
// import 'package:disease_prediction/app/modules/dashboard/views/select_symptoms_view.dart';
// import 'package:disease_prediction/app/utils/contants.dart';
// import 'package:disease_prediction/components/rounded_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/dashboard_controller.dart';
// class DashboardView extends GetView<DashboardController> {
//   const DashboardView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Image.asset('assets/images/bck.png'),
//             ),
//             const SizedBox(height: defaultPadding * 2),
//             Center(
//               child: RoundedButton(
//                   text: "Check symptoms",
//                   press: () {
//                     Get.to(() => const BodySelectorView());
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class BodySelectorView extends GetView<DashboardController> {
//   const BodySelectorView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Parts Selector'),
//         centerTitle: false,
//       ),
//       body: SafeArea(
//         child: Obx(
//           () => Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   "Select your body part",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Expanded(
//                 child: BodyPartSelectorTurnable(
//                   mirrored: false,
//                   bodyParts: controller.bodyParts.value,
//                   onSelectionUpdated: (p) {
//                     controller.bodyParts.value = p;
//                     Timer(const Duration(milliseconds: 100), () {
//                       controller.bodyParts.value = const BodyParts();
//                       Get.to(() => const SelectSymptomsView(), arguments: p);
//                     });
//                   },
//                   labelData: null,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
