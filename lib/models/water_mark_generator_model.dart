import 'dart:isolate';

import 'package:image_water_marker/models/config_file_model.dart';
import 'package:image_water_marker/models/image_model.dart';
import 'package:screenshot/screenshot.dart';

class WaterMarkGeneratorModel {
  List<ImageModel>? imageModels;
  ConfigFileModel? configModel;
  String? brandFilePath;
  ScreenshotController? screenShot;
  double? leftBrandsBorder;
  double? rightBrandsBorder;
  double? leftBusinessBorder;
  double? rightBusinessBorder;
  SendPort? port;
  double? height;
  double? width;
  String? title;
  String? savePath;

  WaterMarkGeneratorModel({
    this.imageModels,
    this.configModel,
    this.brandFilePath,
    this.screenShot,
    this.rightBrandsBorder,
    this.leftBrandsBorder,
    this.leftBusinessBorder,
    this.rightBusinessBorder,
    this.port,
    this.height,
    this.width,
    this.title,
    this.savePath,
  });
}
