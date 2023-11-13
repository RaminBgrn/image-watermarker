import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_water_marker/controller/config_file_controller.dart';
import 'package:image_water_marker/models/config_file_model.dart';

class SettingController extends GetxController {
  // config file model;
  ConfigFileModel _configFileModel = ConfigFileModel();

  // =========================== logo section ===============================
  bool _showLogoSection = true;
  bool get hasShowLogo => _showLogoSection;
  set checkToShowLog(bool data) {
    _showLogoSection = data;
    update();
  }

  bool _isImageSet = false;
  bool get hasImage => _isImageSet;

  final TextEditingController _businessLogosPath = TextEditingController();
  TextEditingController get getBusinessLogoPath => _businessLogosPath;

  File? _selectedFile;
  File get getLogoImage => _selectedFile!;

// =========================== Water mark Section ===========================

  final TextEditingController _waterMarkImageFilePathController =
      TextEditingController();
  TextEditingController get getWaterMarkImageFilePathController =>
      _waterMarkImageFilePathController;

// ============================= brand Section ==============================

  bool _showBrandsLogo = true;
  bool get hasShowBrands => _showBrandsLogo;
  set showOrHideBrand(bool hasShow) {
    _showBrandsLogo = hasShow;
    update();
  }

  final TextEditingController _brandsFolderPathController =
      TextEditingController();
  TextEditingController get getBrandsFolderPathController =>
      _brandsFolderPathController;

  Alignment _brandsLogoAlignment = Alignment.bottomLeft;
  Alignment get getBrandsLogoAlignment => _brandsLogoAlignment;

  Alignment _businessLogoAlignment = Alignment.topRight;
  Alignment get getBusinessLogoAlignment => _businessLogoAlignment;

  double _waterMarkOpacity = 0.50;
  double get getWaterMarkOpacity => _waterMarkOpacity;

  double _imageBoarderRadius = 0;
  double get getImageBoarderRadius => _imageBoarderRadius;

  double _leftBrandBoarderWidth = 5;
  double get getLeftBrandBoarderWidth => _leftBrandBoarderWidth;
  double _rightBrandBoarderWidth = 1;
  double get getRightBrandBoarderWidth => _rightBrandBoarderWidth;

  double _leftBusinessBoarderWidth = 1;
  double get getLeftBusinessBoarderWidth => _leftBusinessBoarderWidth;
  double _rightBusinessBoarderWidth = 5;
  double get getRightBusinessBoarderWidth => _rightBusinessBoarderWidth;

  // Functions

  @override
  void onInit() {
    _configFileModel = Get.find<ConfigFileController>().getConfigModel;
    _waterMarkImageFilePathController.text =
        _configFileModel.waterMarkImage ?? '';
    _brandsFolderPathController.text = _configFileModel.brandsLogo ?? '';
    _businessLogosPath.text = _configFileModel.businessLogo ?? '';
    _waterMarkOpacity = _configFileModel.waterMarkOpacity ?? 0.6;
    super.onInit();
  }

  void changeBrandsLogoAlignment(Alignment align) {
    _brandsLogoAlignment = align;
    _checkBrandsBoarder(align);
  }

  void _checkBrandsBoarder(Alignment align) {
    if (align == Alignment.topRight || align == Alignment.bottomRight) {
      _leftBrandBoarderWidth = 1;
      _rightBrandBoarderWidth = 5;
    } else {
      _leftBrandBoarderWidth = 5;
      _rightBrandBoarderWidth = 1;
    }
    update();
  }

  void changeBusinessLogoAlignment(Alignment align) {
    _businessLogoAlignment = align;
    _checkBusinessBoarder(align);
  }

  void _checkBusinessBoarder(Alignment align) {
    if (align == Alignment.topRight || align == Alignment.bottomRight) {
      _leftBusinessBoarderWidth = 1;
      _rightBusinessBoarderWidth = 5;
    } else {
      _leftBusinessBoarderWidth = 5;
      _rightBusinessBoarderWidth = 1;
    }
    update();
  }

  void setImageBoarderRadius(double radius) {
    _imageBoarderRadius = radius;
    update();
  }

  void setWaterMarkOpacity(double opacity) {
    _waterMarkOpacity = opacity;
    update();
  }

  void clearBusinessLogo() {
    _businessLogosPath.text = "";
    _isImageSet = false;
    update();
  }

  void getBusinessLogo() async {
    ImagePicker businessImage = ImagePicker();
    XFile? businessLogo =
        await businessImage.pickImage(source: ImageSource.gallery);
    if (businessLogo != null) {
      _businessLogosPath.text = businessLogo.path;
      _isImageSet = true;
      _selectedFile = File(businessLogo.path);
      update();
    }
  }
}
