import 'dart:convert';
import 'dart:io';

import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/base_controller.dart';
import 'package:image_water_marker/controller/config_file_controller.dart';
import 'package:image_water_marker/screens/home.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions options = const WindowOptions(
      size: Size(1000, 500),
      center: true,
      skipTaskbar: false,
      minimumSize: Size(1200, 800),
      titleBarStyle: TitleBarStyle.normal,
      title: "WaterMarker");
  windowManager.waitUntilReadyToShow(options, () async {
    await windowManager.show();
    await windowManager.focus();
    // await windowManager.setMinimizable(false);
    await windowManager.setMinimumSize(const Size(1200, 800));
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Water Marker',
      initialBinding: BaseController(),
      onInit: () => Get.find<ConfigFileController>().checkConfigFile(),
      // onReady: () => Get.find<ConfigFileController>().readData(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EyeDrop(child: const Home()),
    );
  }
}
