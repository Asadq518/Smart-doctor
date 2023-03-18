// // ignore_for_file: avoid_print

// import 'package:disease_prediction/app/modules/dashboard/controllers/dashboard_controller.dart';
// import 'package:disease_prediction/app/utils/contants.dart';
// import 'package:disease_prediction/components/rounded_button.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class SelectSymptomsView extends GetView<DashboardController> {
//   const SelectSymptomsView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Symptoms'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             width: double.infinity,
//             child: Padding(
//               padding: EdgeInsets.all(defaultPadding),
//               child: Text(
//                 'Choose your Symptoms',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: defaultPadding,
//           ),

//           const Center(child: MyChips()),
//           const SizedBox(
//             height: defaultPadding,
//           ),
//           RoundedButton(text: "Check Disease", press: () {}),
//           // Center(child: MyChips()),
//         ],
//       ),
//     );
//   }
// }

// class MyChips extends StatefulWidget {
//   const MyChips({
//     super.key,
//   });

//   @override
//   State<MyChips> createState() => _MyChipsState();
// }

// class _MyChipsState extends State<MyChips> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8,
//       direction: Axis.horizontal,
//       children: filterChipsList(),
//     );
//   }

//   List<Widget> filterChipsList() {
//     List<Widget> chips = [];

// ignore_for_file: avoid_print, must_be_immutable

//     var controller = Get.find<DashboardController>();
//     for (int i = 0; i < controller.chipsList.length; i++) {
//       Widget item = Padding(
//         padding: const EdgeInsets.only(left: 10, right: 5),
//         child: Obx(
//           () => FilterChip(
//             label: Text(controller.chipsList[i].label),
//             labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
//             backgroundColor: controller.chipsList[i].color,
//             selected: controller.chipsList[i].isSelected,
//             onSelected: (bool value) {
//               print("hbhjkh $i");
//               setState(() {
//                 controller.chipsList[i].isSelected = value;
//                 // controller.onInit();
//                 // controller.update();
//               });
//             },
//           ),
//         ),
//       );
//       chips.add(item);
//     }
//     return chips;
//   }
// }
import 'package:disease_prediction/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:disease_prediction/app/utils/contants.dart';
import 'package:disease_prediction/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSymptomsView extends GetView<DashboardController> {
  const SelectSymptomsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.chipArg();
    controller.symptomsSelected.value = '';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Symptoms'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.progress.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Text(
                          'Choose your Symptoms',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Obx(() => Wrap(
                                spacing: 8,
                                direction: Axis.horizontal,
                                children: filterChipsList(),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    RoundedButton(
                        text: "Check Disease",
                        press: () {
                          controller.checkDiseaseApi(
                              controller.symptomsSelected.value,
                              controller.BodyPartSelected.value);
                          print("wow123${controller.symptomsSelected.value}");
                        }),
                  ],
                ),
        ));
  }

  List<Widget> filterChipsList() {
    List<Widget> chips = [];
    for (int i = 0; i < controller.chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: Obx(
          () => FilterChip(
            label: Text(controller.chipsList[i].label),
            labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
            backgroundColor: controller.chipsList[i].color,
            selected: controller.chipsList[i].isSelected,
            onSelected: (bool value) {
              print(value);
              controller.chipsList[i] = ItemModel(controller.chipsList[i].label,
                  controller.chipsList[i].color, value);

              if (controller.symptomsSelected.value == "") {
                print("wow123$value");
                // if (!value) {
                //   controller.symptomsSelected.value =
                //       controller.symptomsSelected.value.replaceAll(controller.chipsList[i].label, '');
                controller.symptomsSelected.value =
                    controller.chipsList[i].label;
              } else {
                if (!value) {
                  print("wow123$value");
                  if (!controller.symptomsSelected.value.contains(",")) {
                    controller.symptomsSelected.value = controller
                        .symptomsSelected.value
                        .replaceAll(controller.chipsList[i].label, '');
                  } else {
                    controller.symptomsSelected.value = controller
                        .symptomsSelected.value
                        .replaceAll(",${controller.chipsList[i].label}", '');
                  }
                } else {
                  controller.symptomsSelected.value +=
                      ",${controller.chipsList[i].label}";
                }
              }
            },
          ),
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

class PredictionView extends GetView<DashboardController> {
  const PredictionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              'Disease',
              // ,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              '${Get.arguments['prediction']}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                // fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              'Detail',
              // ,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              '${Get.arguments['disease_detail']}',
              // ,
              textAlign: TextAlign.justify,

              style: const TextStyle(
                height: 1.5,
                fontSize: 20,
                color: Colors.black,
                // fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
