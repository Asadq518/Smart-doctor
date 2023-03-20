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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

class PossibleCondition extends GetView<DashboardController> {
  const PossibleCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Possible Conditions",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            )),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Understanding Your Results",
                style: TextStyle(
                    color: Colours.kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.info_outline,
                color: Colours.kPrimaryColor,
              ),
            ],
          ),
        ),
        ListTile(
            onTap: () {
              // Get.to(const PredictionView());
              Get.off(() => const PredictionView(), arguments: Get.arguments);
            },
            tileColor: Colors.white,
            title: const Text(
              "Allergy",
              style: TextStyle(color: Colors.black),
            ),
            trailing: RatingBar.builder(
              initialRating: 1,
              minRating: 0.5,
              itemSize: 15,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 4,
              itemBuilder: (context, _) => const Icon(
                Icons.rectangle_rounded,
                color: Colors.blue,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )),
        const SizedBox(
          height: 5,
        ),
        ListTile(
            onTap: () =>
                Get.off(() => const PredictionView(), arguments: Get.arguments),
            tileColor: Colors.white,
            title: const Text(
              "Diphtheria",
              style: TextStyle(color: Colors.black),
            ),
            trailing: RatingBar.builder(
              initialRating: 1,
              minRating: 0.5,
              itemSize: 15,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 4,
              itemBuilder: (context, _) => const Icon(
                Icons.rectangle_rounded,
                color: Colors.blue,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )),
        const SizedBox(
          height: 5,
        ),
        ListTile(
            onTap: () =>
                Get.off(() => const PredictionView(), arguments: Get.arguments),
            tileColor: Colors.white,
            title: const Text(
              "Infection/HIV",
              style: TextStyle(color: Colors.black),
            ),
            trailing: RatingBar.builder(
              initialRating: 1,
              minRating: 0.5,
              itemSize: 15,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 4,
              itemBuilder: (context, _) => const Icon(
                Icons.rectangle_rounded,
                color: Colors.blue,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Load 10 More Conditions",
          style: TextStyle(
              color: Colours.kPrimaryColor, fontWeight: FontWeight.w500),
        )
      ]),
    );
  }
}
