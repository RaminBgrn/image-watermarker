import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/import_image_controller.dart';
import 'package:image_water_marker/models/image_model.dart';

class EditImageController extends GetxController {
  BoxFit _fit = BoxFit.contain;
  BoxFit get getBoxFit => _fit;

  final List<ImageModel> _imageModel = [];
  List<ImageModel> get getImageModel => _imageModel;

  bool _brandFlag = false;
  bool get isBrandSelected => _brandFlag;

  String _brand = '';
  String get getBrandFilePath => _brand;

  void changeImageFit(BoxFit fit) {
    _fit = fit;
    update();
  }

  void removeImage(int index) {
    _imageModel.removeAt(index);
    update();
  }

  void importImage() async {
    List<File> images = await Get.find<ImportImageController>().selectImageToWaterMark();
    for (File file in images) {
      _imageModel.add(
        ImageModel(
          image: file,
          backgroundColor: Colors.white,
          imageBoxFit: BoxFit.contain,
        ),
      );
    }
    update();
  }

  void selectBrand(String brandPath) {
    _brandFlag = true;
    _brand = brandPath;
    update();
  }
}
