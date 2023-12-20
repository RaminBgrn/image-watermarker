import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/common/utilis_design.dart';
import 'package:image_water_marker/controller/config_file_controller.dart';
import 'package:image_water_marker/controller/edit_image_controller.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/models/config_file_model.dart';
import 'package:image_water_marker/models/water_mark_generator_model.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/custom_text_field.dart';
import 'package:image_water_marker/widgets/text_field_with_title.dart';
import 'package:screenshot/screenshot.dart';

import '../models/image_model.dart';

class WaterMarkController extends GetxController {
  double _height = 1000;
  double get getHeight => _height;
  double _width = 1000;
  double get getWidth => _width;
  String _title = "";
  String get getTitle => _title;
  late String _savePath;
  final PageController _controller = PageController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _savePathController = TextEditingController();

  @override
  void onReady() {
    _savePath = Get.find<ConfigFileController>().getDefaultOutputPath;
    _savePathController.text = _savePath;
    update();
    super.onReady();
  }

  @override
  void onClose() {
    _titleController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _controller.dispose();
    super.onClose();
  }

  void savePath() {}

  void makeWatermark(List<ImageModel> model, ConfigFileModel configModel) {
    ReceivePort port = ReceivePort();
    WaterMarkGeneratorModel waterMarkModel = WaterMarkGeneratorModel(
      imageModels: model,
      screenShot: ScreenshotController(),
      configModel: configModel,
      brandFilePath: Get.find<EditImageController>().getBrandFilePath,
      port: port.sendPort,
      height: _height,
      width: _width,
      savePath: _savePath,
      title: _titleController.text,
      leftBrandsBorder: Get.find<SettingController>().getLeftBrandBoarderWidth,
      rightBrandsBorder: Get.find<SettingController>().getRightBrandBoarderWidth,
      leftBusinessBorder: Get.find<SettingController>().getLeftBusinessBoarderWidth,
      rightBusinessBorder: Get.find<SettingController>().getRightBusinessBoarderWidth,
    );
    executeWidgetToImage(waterMarkModel);
    // Isolate.spawn<WaterMarkGeneratorModel>(
    //   executeWidgetToImage,
    //   waterMarkModel,
    // );
  }

  void showSaveDialog() {
    Get.dialog(Dialog(
      child: Container(
        width: 400,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: myGrey[700]!,
        ),
        child: PageView(
          controller: _controller,
          children: [_firstPage(), _secondPage()],
        ),
      ),
    ));
  }

  Widget _secondPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Please wait it can take several minutes",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: myGrey[300],
          ),
        ),
        CircularProgressIndicator(
          color: myBlueGrey[300],
        ),
      ],
    );
  }

  Widget _firstPage() {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CustomTextField(
          controller: _titleController,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
                flex: 3,
                child: CustomTextField(
                  hint: "Image With (PX)",
                  controller: _widthController,
                  maxLength: 4,
                  formatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 3,
              child: CustomTextField(
                hint: "Image Height (PX)",
                controller: _heightController,
                formatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 4,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
        TextFieldWithTitle(
          controller: _savePathController,
          textFieldHint: 'Save images path',
          onTap: () {},
          removeButtonFlag: false,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              makeWatermark(Get.find<EditImageController>().getImageModel, Get.find<SettingController>().getConfigFileModel);
              _height = double.tryParse(_heightController.text)!;
              _width = double.tryParse(_widthController.text)!;
              _title = _titleController.text;
              _savePath = _savePathController.text;
            },
            child: Container(
              width: 80,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myGreen[900]!.withOpacity(0.2),
                border: Border.all(
                  width: 1,
                  color: myGreen[300]!,
                ),
              ),
              child: Text(
                'START',
                style: GoogleFonts.karla(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: myGreen[400],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  void executeWidgetToImage(WaterMarkGeneratorModel models) async {
    ScreenshotController shot = models.screenShot!;
    List<ImageModel> images = models.imageModels!;
    Directory("${models.savePath}/${models.title}").createSync(recursive: true);
    for (int i = 0; i < images.length; i++) {
      String watermark = "${models.savePath}/${models.title}/${models.title}-$i.png";
      shot
          .captureFromWidget(
              SizedBox(
                width: models.width,
                height: models.height,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(models.configModel!.imageBorderRadius ?? 0),
                          color: images[i].backgroundColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(models.configModel!.imageBorderRadius ?? 0),
                          child: Image.file(
                            images[i].image!,
                            width: models.width,
                            height: models.height,
                            fit: images[i].imageBoxFit,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: convertAlignmentsToEnum(models.configModel!.waterMarkLogoPosition!),
                      child: Opacity(
                        opacity: models.configModel!.waterMarkOpacity!,
                        child: models.configModel!.waterMarkImage != null && models.configModel!.waterMarkImage!.isNotEmpty
                            ? SvgPicture.file(
                                File(models.configModel!.waterMarkImage!),
                                width: models.height,
                                fit: convertStringToBoxFitEnum(models.configModel!.waterMarkImageBoxFit!),
                              )
                            : const SizedBox(),
                      ),
                    ),
                    Positioned.fill(
                      top: 16,
                      child: Align(
                        alignment: convertAlignmentsToEnum(models.configModel!.businessLogoPosition!),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 8,
                              sigmaY: 8,
                            ),
                            child: Container(
                              width: 240,
                              height: 90,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: models.rightBusinessBorder!, color: const Color(0xFFFDBCC7)),
                                  top: const BorderSide(width: 3, color: Color(0xFFFDBCC7)),
                                  bottom: const BorderSide(width: 3, color: Color(0xFFFDBCC7)),
                                  left: BorderSide(width: models.leftBusinessBorder!, color: const Color(0xFFFDBCC7)),
                                ),
                              ),
                              child: models.configModel!.businessLogo != null && models.configModel!.businessLogo!.isNotEmpty
                                  ? SvgPicture.file(
                                      File(models.configModel!.businessLogo!),
                                      width: 240,
                                      height: 90,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 60,
                      child: Align(
                        alignment: convertAlignmentsToEnum(models.configModel!.brandsPosition!),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 8,
                              sigmaY: 8,
                            ),
                            child: Container(
                              width: 215,
                              height: 90,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: models.rightBrandsBorder!, color: const Color(0xFFFDBCC7)),
                                  top: const BorderSide(width: 3, color: Color(0xFFFDBCC7)),
                                  bottom: const BorderSide(width: 3, color: Color(0xFFFDBCC7)),
                                  left: BorderSide(width: models.leftBrandsBorder!, color: const Color(0xFFFDBCC7)),
                                ),
                              ),
                              child: models.brandFilePath != null && models.brandFilePath!.isNotEmpty
                                  ? SvgPicture.file(
                                      File(models.brandFilePath!),
                                      width: 240,
                                      height: 90,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(models.configModel!.imageBorderRadius ?? 0),
                          bottomRight: Radius.circular(models.configModel!.imageBorderRadius ?? 0),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: SizedBox(
                            width: models.width,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'https:// ',
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          color: myGrey[500],
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'GOLEYAKH.STORE', // from model
                                        style: GoogleFonts.openSans(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: myGrey[500],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  models.title!,
                                  style: GoogleFonts.openSans(
                                    fontSize: 53,
                                    color: myGrey[500],
                                    fontWeight: FontWeight.w900,
                                    height: 1,
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              targetSize: Size(models.width!, models.height!))
          .then((value) {
        File myWater = File(watermark);
        myWater.writeAsBytesSync(value);
      });
    }
    Get.back();
  }
}
