import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'Welcome/components/body.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
 

// import 'package:body_part_selector/body_part_selector.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeView'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Obx(
//           () => BodyPartSelectorTurnable(
//             mirrored: false,
//             bodyParts: controller.bodyParts.value,
//             onSelectionUpdated: (p) {

//               // print(p.toJson());
//               controller.bodyParts.value = p;
//             },
//             labelData: null,
//           ),
//         ),
//       ),
//     );
//   }
// }
