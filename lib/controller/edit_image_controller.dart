import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditImageController extends GetxController {
  BoxFit _fit = BoxFit.contain;
  BoxFit get getBoxFit => _fit;

  void changeImageFit(BoxFit fit) {
    _fit = fit;
    update();
  }
}
