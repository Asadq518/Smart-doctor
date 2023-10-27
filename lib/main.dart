import 'package:disease_prediction/app/utils/contants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  const storage = FlutterSecureStorage();
 
  String? key=await storage.read(key: 'key');
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colours.kPrimaryColor),
      ),
      initialRoute: 
      key!=null?AppPages.INITIAL2:
      AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

