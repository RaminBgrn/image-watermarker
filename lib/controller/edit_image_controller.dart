import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/common/my_snackbar.dart';
import 'package:image_water_marker/controller/import_image_controller.dart';
import 'package:image_water_marker/models/image_model.dart';
import 'package:image_water_marker/utils/colors.dart';

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
    try {
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
    } catch (e) {
      MySnackBar.showMySnackBar(
        titleColor: myRed[400]!,
        messageColor: myRed[100]!,
        title: 'Error',
        message: 'Image has not select',
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
