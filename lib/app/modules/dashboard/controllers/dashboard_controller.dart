import 'dart:convert';

import 'package:body_part_selector/body_part_selector.dart';
import 'package:disease_prediction/app/modules/dashboard/views/select_symptoms_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  // ignore: prefer_const_constructors
  var bodyParts = BodyParts().obs;
  var BodyPartSelected = ''.obs;
  var symptomsSelected = ''.obs;
  var progress = true.obs;
  final count = 0.obs;

  void increment() => count.value++;

  RxList<ItemModel> chipsList = <ItemModel>[].obs;

  void chipArg() {
    chipsList.clear();
    BodyParts data = Get.arguments;
    if (data.head || data.vestibular) {
      symtomsApi("head");
    }
    if (data.neck) {
      symtomsApi("neck");
    }
    if (data.leftShoulder || data.rightShoulder) {
      symtomsApi("rightShoulder");
    }
    if (data.leftLowerArm ||
        data.leftUpperArm ||
        data.rightLowerArm ||
        data.rightUpperArm) {
      symtomsApi("leftLowerArm");
    }
    if (data.leftHand || data.rightHand) {
      symtomsApi("leftHand");
    }
    if (data.upperBody) {
      symtomsApi("upperBody");
    }
    if (data.lowerBody || data.abdomen) {
      symtomsApi("lowerBody");
    }
    if (data.leftLowerLeg ||
        data.leftUpperLeg ||
        data.rightLowerLeg ||
        data.rightUpperLeg ||
        data.leftKnee ||
        data.rightKnee) {
      symtomsApi("leftLowerLeg:");
    }
    if (data.leftFoot || data.rightFoot) {
      symtomsApi("leftFoot");
    }

  }

  Future<void> symtomsApi(String s) async {
    progress.value = true;
    BodyPartSelected.value = s;
    var response = await http.get(
        Uri.parse("https://flask111.pythonanywhere.com/getSymptoms?body=$s"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      progress.value = false;
      for (String i in data['symptoms']) {
        chipsList.add(
          ItemModel(i, Colors.green, false),
        );
      }
    }
  }

  Future<void> checkDiseaseApi(String symptoms, String body) async {
    progress.value = true;

    var response = await http.get(Uri.parse(
        "http://flask111.pythonanywhere.com/getDisease?body=$body&symptom=$symptoms"));
    if (response.statusCode == 200) {
      progress.value = false;
      var data = jsonDecode(response.body.toString());
      Get.off(() => const PredictionView(), arguments: data);
    } else {
      progress.value = false;
    }
  }
}

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}

