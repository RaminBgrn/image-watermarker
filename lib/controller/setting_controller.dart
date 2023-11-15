import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_water_marker/common/my_snackbar.dart';
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

  bool _isWaterMarkFileSelected = false;
  bool get isWaterMarkSelect => _isWaterMarkFileSelected;

  late File _waterMarkFile;
  File get getWaterMarkFile => _waterMarkFile;

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
  void onReady() {
    _configFileModel = Get.find<ConfigFileController>().getConfigModel;
    _waterMarkImageFilePathController.text =
        _configFileModel.waterMarkImage ?? '';
    _brandsFolderPathController.text = _configFileModel.brandsLogo ?? '';
    _businessLogosPath.text = _configFileModel.businessLogo ?? '';
    _waterMarkOpacity = _configFileModel.waterMarkOpacity ?? 0.6;
    super.onReady();
  }

  // get water mark image section

  void chooseWaterMark() async {
    try {
      _waterMarkFile = await _getImage();
      _isWaterMarkFileSelected = true;
      Get.find<ConfigFileController>()
          .updateConfigFile(data: _waterMarkFile.path, key: 'water_mark');
      update();
    } catch (e) {
      MySnackBar.showMySnackBar(Colors.black,
          title: 'Error', message: 'File has not select');
    }
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

  Future<File> _getImage() async {
    ImagePicker businessImage = ImagePicker();
    XFile? selectedFile =
        await businessImage.pickImage(source: ImageSource.gallery);
    if (selectedFile == null) throw Exception();
    return File(selectedFile.path);
  }
}
