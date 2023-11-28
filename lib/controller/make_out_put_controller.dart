import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeOutPutController extends GetxController {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get getSaveFileNameController => _controller;
}
