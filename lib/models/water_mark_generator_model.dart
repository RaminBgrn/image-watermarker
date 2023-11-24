import 'dart:io';
import 'dart:isolate';

import 'package:image_water_marker/models/image_model.dart';

class WaterMarkGeneratorModel {
  List<ImageModel>? imageModels;
  ReceivePort? port;
  File? brand;
  File? logo;
  File? waterMark;
  double? hight;
  double? width;
  String? title;
  String? savePath;
  bool? showProductIdFlag;
  String? webSiteAddress;
  bool? showWebsiteFlag;

  WaterMarkGeneratorModel({
    this.imageModels,
    this.port,
    this.brand,
    this.logo,
    this.waterMark,
    this.hight,
    this.width,
    this.title,
    this.savePath,
    this.showProductIdFlag,
    this.webSiteAddress,
    this.showWebsiteFlag,
  });
}
