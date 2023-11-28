import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  final PageController _controller = PageController();
  PageController get getPageController => _controller;

  void moveToSetting() {
    _controller.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void moveToGrid() {
    _controller.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
