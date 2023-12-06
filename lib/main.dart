import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/splashscreen_controller.dart';
import 'package:flutter_project/pages/splashscreenview.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreenView(),

    );
  }
}

