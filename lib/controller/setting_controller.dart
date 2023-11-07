import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  TextEditingController _productLogosPath = TextEditingController();
  TextEditingController get getProductLogosPathController => _productLogosPath;

  double _waterMarkOpacity = 0.50;
  double get getWaterMarkOpacity => _waterMarkOpacity;

  void setWaterMarkOpacity(double opacity) {
    _waterMarkOpacity = opacity;
    update();
  }
}
