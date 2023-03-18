// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/contants.dart';
import '../../home/views/Requirements/components/body.dart';
import '../controllers/requirements_controller.dart';

class RequirementsView extends GetView<RequirementsController> {
  const RequirementsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text(' My Profile '),
            //   onTap: () {
            //     // Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.book),
            //   title: Text(' My Course '),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.workspace_premium),
            //   title: Text(' Go Premium '),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.video_label),
            //   title: Text(' Saved Videos '),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.edit),
            //   title: Text(' Edit Profile '),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.logout),
            //   title: Text('LogOut'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Requirements'),
      ),
      body: SafeArea(child: RequirementsBody()),
    );
  }
}
