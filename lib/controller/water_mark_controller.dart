import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/config_file_controller.dart';
import 'package:image_water_marker/controller/edit_image_controller.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/models/water_mark_generator_model.dart';
import 'package:image_water_marker/widgets/setting.dart';

import '../models/image_model.dart';

class WaterMarkController extends GetxController {
  double _height = 1000;
  double get getHeight => _height;
  double _width = 1000;
  double get getWidth => _width;
  String _title = "";
  String get getTitle => _title;
  String _savePath = Get.find<ConfigFileController>().getDefaultOutputPath;
  bool _showProductId = false;
  bool get showProductIdFlag => _showProductId;
  bool _showWebSiteAddress = false;
  bool get showWebsiteAddress => _showWebSiteAddress;
  String _website = "";
  String get getWebsiteAddress => _website;

  void makeWatermark(List<ImageModel> model) {
    ReceivePort port = ReceivePort();
    WaterMarkGeneratorModel waterMarkModel = WaterMarkGeneratorModel(
        imageModels: model,
        port: port,
        brand: File(Get.find<EditImageController>().getBrandFilePath),
        hight: _height,
        width: _width,
        logo: Get.find<SettingController>().hasBusinessLogo ? Get.find<SettingController>().getLogoImage : null,
        savePath: _savePath,
        showProductIdFlag: _showProductId,
        showWebsiteFlag: _showWebSiteAddress,
        title: _title,
        waterMark: Get.find<SettingController>().isWaterMarkSelect ? Get.find<SettingController>().getWaterMarkFile : null,
        webSiteAddress: _website);
    Isolate.spawn<WaterMarkGeneratorModel>(executeWidgetToImage, waterMarkModel);
  }

  void showSaveDialog() {
    Get.dialog(Dialog(
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
      ),
    ));
  }
}

void executeWidgetToImage(WaterMarkGeneratorModel models) {}
