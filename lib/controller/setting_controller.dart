import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final TextEditingController _productLogosPath = TextEditingController();
  TextEditingController get getProductLogosPathController => _productLogosPath;

  Alignment _brandsLogoAlignment = Alignment.bottomLeft;
  Alignment get getBrandsLogoAlignment => _brandsLogoAlignment;

  double _waterMarkOpacity = 0.50;
  double get getWaterMarkOpacity => _waterMarkOpacity;

  void changeBrandsLogoAlignment(Alignment align) {
    print(align);
    _brandsLogoAlignment = align;
    update();
  }

  void setWaterMarkOpacity(double opacity) {
    _waterMarkOpacity = opacity;
    update();
  }
}
