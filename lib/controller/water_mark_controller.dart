import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/import_image_controller.dart';
import 'package:image_water_marker/models/image_model.dart';

class WaterMarkController extends GetxController {
  // image variables
  // List<File> _images = [];
  // List<File> get getImages => _images;
  String brand = '';

  List<ImageModel> _imageModel = [];
  List<ImageModel> get getImageForWaterMark => _imageModel;

  void importImage() async {
    List<File> _images = await Get.find<ImportImageController>().selectImageToWaterMark();
    for (File file in _images) {
      _imageModel.add(
        ImageModel(
          image: file,
          backgroundColor: Colors.white,
          imageBoxFit: BoxFit.contain,
          brand: brand,
        ),
      );
    }

    update();
  }
}
