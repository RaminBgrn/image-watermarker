import 'dart:convert';
import 'dart:io';

import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/base_controller.dart';
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
  checkConfigFile();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Water Marker',
      initialBinding: BaseController(),
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

void checkConfigFile() async {
  String path = Directory.current.path;
  Directory('$path/data').createSync(recursive: true);
  File configFile = File("$path/data/config.json");
  if (!await configFile.exists()) {
    configFile.create();
    Map<String, dynamic> configData = {
      'business_logo': "",
      'brands_logo': "",
      'water_mark': "",
      'water_mark_box_fit': "",
      'water_mark_logo_position': "",
      'product_brands_position': "",
      'business_logo_position': ""
    };
    configFile.writeAsStringSync(jsonEncode(configData));
    return;
  }
  print('exists');
}
