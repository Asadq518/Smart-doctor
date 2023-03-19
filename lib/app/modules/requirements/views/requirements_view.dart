// ignore_for_file: unused_import
import 'package:disease_prediction/app/modules/home/views/home_view.dart';
import 'package:disease_prediction/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/contants.dart';
import '../../home/views/Requirements/components/body.dart';
import '../controllers/requirements_controller.dart';

class RequirementsView extends GetView<RequirementsController> {
  const RequirementsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RequirementsController());
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: Colours.kPrimaryColor,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colours.kPrimaryColor,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colours.kPrimaryColor,
                ),
                accountName: Obx(
                  () => Text(
                    "${controller.name}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                accountEmail: Obx(() => Text("${controller.email}")),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white24,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.leaderboard),
              title: Obx(() => Text(' My Age : ${controller.age} ')),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Obx(() => Text('My Gender : ${controller.gender} ')),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await controller.storage.delete(key: 'key');
                Get.offNamed(Routes.HOME);
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const CircleAvatar(
          backgroundColor: Colors.white24,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: RequirementsBody()),
    );
  }
}
