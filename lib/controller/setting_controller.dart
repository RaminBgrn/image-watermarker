import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/common/my_snackbar.dart';
import 'package:image_water_marker/common/utilis_design.dart';
import 'package:image_water_marker/controller/config_file_controller.dart';
import 'package:image_water_marker/controller/import_image_controller.dart';
import 'package:image_water_marker/models/brands_logo_model.dart';
import 'package:image_water_marker/models/config_file_model.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:path/path.dart';

class SettingController extends GetxController {
  // config file model;
  ConfigFileModel _configFileModel = ConfigFileModel();
  void setConfigFile() async {
    try {
      _configFileModel = ConfigFileModel.fromJson(await Get.find<ConfigFileController>().readData());
    } catch (e) {
      MySnackBar.showMySnackBar(
        titleColor: myRed[400]!,
        messageColor: myRed[100]!,
        title: 'Error',
        message: 'Something went wrong',
      );
    }
  }

  // =========================== logo section ===============================
  bool _showLogoSection = true;
  bool get hasShowLogo => _showLogoSection;
  set checkToShowLog(bool data) {
    _showLogoSection = data;
    _configFileModel.showBusinessLogo = data;
    update();
  }

  String applicationPath = "";

  bool _hasBusinessLogoSet = false;
  bool get hasBusinessLogo => _hasBusinessLogoSet;

  final TextEditingController _businessLogosPathTextController = TextEditingController();
  TextEditingController get getBusinessLogoPathTextController => _businessLogosPathTextController;

  File? _businessLogoFile;
  File get getLogoImage => _businessLogoFile!;

// =========================== Water mark Section ===========================

  bool _isWaterMarkFileSelected = false;
  bool get isWaterMarkSelect => _isWaterMarkFileSelected;

  late File _waterMarkFile;
  File get getWaterMarkFile => _waterMarkFile;

  final TextEditingController _waterMarkImageFilePathController = TextEditingController();
  TextEditingController get getWaterMarkImageFilePathController => _waterMarkImageFilePathController;

// ============================= brand Section ==============================

  bool _showBrandsLogo = true;
  bool get hasShowBrands => _showBrandsLogo;
  set showOrHideBrand(bool hasShow) {
    _showBrandsLogo = hasShow;
    _configFileModel.showBrandsLogo = hasShow;
    update();
  }

  //========================== dropdown variables ============================

  bool _hasBrandsSelected = false;
  bool get hasBrands => _hasBrandsSelected;

  List<File> _brands = [];
  List<File> get getBrands => _brands;

  List<BrandsLogoModel> _brandsLogoModel = [];
  List<BrandsLogoModel> get getBrandsLogoModel => _brandsLogoModel;

  final TextEditingController _brandsFolderPathController = TextEditingController();
  TextEditingController get getBrandsFolderPathController => _brandsFolderPathController;

  int _brandAlignmentSelectedIndex = 2;
  int get getBrandAlignmentSelectedIndex => _brandAlignmentSelectedIndex;
  Alignment _brandsLogoAlignment = Alignment.bottomLeft;
  Alignment get getBrandsLogoAlignment => _brandsLogoAlignment;

  int _businessLogoAlignmentIndex = 0;
  int get getBusinessLogoAlignmentIndex => _businessLogoAlignmentIndex;
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

  // water mark position
  int _selectedWaterMarkPositionIndex = 1;
  int get getSelectedWatermarkPosition => _selectedWaterMarkPositionIndex;
  Alignment _waterMarkAlignment = Alignment.center;
  Alignment get getWaterMarkAlignment => _waterMarkAlignment;

  // water mark box fit
  int _selectedWaterMarkBoxFitIndex = 1;
  int get getSelectedWaterMarkBoxFitIndex => _selectedWaterMarkBoxFitIndex;
  BoxFit _waterMarkBoxFit = BoxFit.contain;
  BoxFit get getWaterMarkBoxFit => _waterMarkBoxFit;

  // Functions

  @override
  void onInit() {
    applicationPath = Directory.current.path;

    super.onInit();
  }

  @override
  void onReady() {
    Get.dialog(Dialog(
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: myGrey[200],
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: myGrey[100]!.withOpacity(0.2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircularProgressIndicator(),
            Text(
              'Please wait a few second...',
              style: GoogleFonts.karla(
                fontSize: 18,
                color: myGrey[700],
              ),
            )
          ],
        ),
      ),
    ));
    setConfigFile();

    Future.delayed(const Duration(seconds: 2), () {
      initComponents();
      Get.back();
    });
    super.onReady();
  }

  void initComponents() {
    Get.dialog(Container(
      width: 100,
      height: 100,
      color: Colors.white,
    ));
    _selectedWaterMarkBoxFitIndex = _configFileModel.waterMarkBoxFitIndex ?? 1;
    _selectedWaterMarkPositionIndex = _configFileModel.waterMarkPositionIndex ?? 1;
    _showBrandsLogo = _configFileModel.showBrandsLogo ?? true;
    _showLogoSection = _configFileModel.showBusinessLogo ?? true;
    _waterMarkImageFilePathController.text = _configFileModel.waterMarkImage ?? '';
    if (_configFileModel.waterMarkImage != null && _configFileModel.waterMarkImage!.isNotEmpty) {
      _waterMarkFile = File(_configFileModel.waterMarkImage!);
      _isWaterMarkFileSelected = true;
    }
    _businessLogosPathTextController.text = _configFileModel.businessLogo ?? '';
    if (_configFileModel.businessLogo != null && _configFileModel.businessLogo!.isNotEmpty) {
      _hasBusinessLogoSet = true;
      _businessLogoFile = File(_configFileModel.businessLogo!);
    }
    if (_configFileModel.brandsLogo != null && _configFileModel.brandsLogo!.isNotEmpty) {
      _brandsLogoModel = _configFileModel.brandsLogo ?? [];
    }
    _waterMarkBoxFit = convertStringToBoxFitEnum(_configFileModel.waterMarkImageBoxFit ?? "BoxFit.contain");
    _waterMarkAlignment = convertAlignmentsToEnum(_configFileModel.waterMarkLogoPosition ?? "Alignment.center");
    _brandsLogoAlignment = convertAlignmentsToEnum(_configFileModel.brandsPosition ?? "Alignment.bottomLeft");
    _businessLogoAlignment = convertAlignmentsToEnum(_configFileModel.businessLogoPosition ?? 'Alignment.topRight');
    _waterMarkOpacity = _configFileModel.waterMarkOpacity ?? 0.6;
    _imageBoarderRadius = _configFileModel.imageBorderRadius ?? 4;
    _businessLogoAlignmentIndex = _configFileModel.businessLogoSelectedIndex ?? 0;
    _brandAlignmentSelectedIndex = _configFileModel.brandSelectedIndex ?? 2;
    update();
    Get.back();
  }

  // get business Logo file

  void chooseBusinessLogoFile() async {
    try {
      _businessLogoFile = await Get.find<ImportImageController>().getSingleSvg('business logo');
      _hasBusinessLogoSet = true;
      _configFileModel.businessLogo = _businessLogoFile!.path;
      _businessLogosPathTextController.text = basename(_businessLogoFile!.path);
      update();
    } catch (e) {
      MySnackBar.showMySnackBar(
        titleColor: myRed[400]!,
        messageColor: myRed[100]!,
        title: 'Error',
        message: 'Image has not select',
      );
    }
  }

  // clear business logo data

  void clearBusinessLogo() {
    _businessLogosPathTextController.text = "";
    _hasBusinessLogoSet = false;
    _configFileModel.businessLogo = "";

    update();
  }

  // get water mark image section

  void chooseWaterMark() async {
    try {
      _waterMarkFile = await Get.find<ImportImageController>().getSingleSvg('water mark');
      _isWaterMarkFileSelected = true;
      _waterMarkImageFilePathController.text = basename(_waterMarkFile.path);
      _configFileModel.waterMarkImage = _waterMarkFile.path;
      update();
    } catch (e) {
      e.printError();
      MySnackBar.showMySnackBar(
        titleColor: myRed[400]!,
        messageColor: myRed[100]!,
        title: 'Error',
        message: 'Image has not select',
      );
    }
  }

  // clear water mark image
  void clearWaterMarkImage() {
    _isWaterMarkFileSelected = false;
    _waterMarkImageFilePathController.clear();
    _configFileModel.waterMarkImage = "";
    update();
  }

  // get brands from hard disk

  void getBrandsLogoFormHard() async {
    try {
      _brands = await Get.find<ImportImageController>().getMultiSvg();
      _hasBrandsSelected = true;
      _brandsFolderPathController.text = "$applicationPath/data/products logos";
      update();
    } catch (e) {
      MySnackBar.showMySnackBar(
        titleColor: myRed[400]!,
        messageColor: myRed[100]!,
        title: 'Error',
        message: 'Image has not select',
      );
    }
  }

  // clear brands data
  void clearBrandsLogoPath() {
    _brands = [];
    _hasBrandsSelected = false;
    _brandsFolderPathController.text = '';
    update();
  }

  // convert to model
  void convertBrandsDataToModel(List<File> images) {
    for (File image in images) {
      _brandsLogoModel.add(BrandsLogoModel(title: basename(image.path), imagePath: image.path));
    }
    _configFileModel.brandsLogo = _brandsLogoModel;
    update();
  }

  // change brand logo alignment and update config file
  void changeBrandsLogoAlignment(Alignment align, int index) {
    _brandsLogoAlignment = align;
    _checkBrandsBoarder(align);
    _brandAlignmentSelectedIndex = index;
    _configFileModel.brandsPosition = align.toString();
    _configFileModel.brandSelectedIndex = _brandAlignmentSelectedIndex;
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

  void changeBusinessLogoAlignment(Alignment align, int index) {
    _businessLogoAlignment = align;
    _checkBusinessBoarder(align);
    _businessLogoAlignmentIndex = index;
    _configFileModel.businessLogoPosition = align.toString();
    _configFileModel.businessLogoSelectedIndex = index;
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
    _configFileModel.imageBorderRadius = radius;
    update();
  }

  void setWaterMarkAlignment(Alignment alignment, int index) {
    _waterMarkAlignment = alignment;
    _selectedWaterMarkPositionIndex = index;
    _configFileModel.waterMarkLogoPosition = alignment.toString();
    _configFileModel.waterMarkPositionIndex = index;
    update();
  }

  void setWaterMarkOpacity(double opacity) {
    _waterMarkOpacity = opacity;
    _configFileModel.waterMarkOpacity = opacity;
    update();
  }

  void setWaterBoxFit(BoxFit fit, int index) {
    _waterMarkBoxFit = fit;
    _configFileModel.waterMarkImageBoxFit = fit.toString();
    _configFileModel.waterMarkBoxFitIndex = index;
    _selectedWaterMarkBoxFitIndex = index;
    update();
  }

  void saveConfigs() {
    MySnackBar.showMySnackBar(
      titleColor: myGreen[400]!,
      messageColor: myGreen[100]!,
      title: 'Success',
      message: 'Setting has saved',
    );
    Get.find<ConfigFileController>().updateConfigFile(model: _configFileModel);
  }
}
