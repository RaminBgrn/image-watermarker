import 'dart:io';

import 'package:flutter/material.dart';

class ImageModel {
  File? image;
  String? brand;
  BoxFit? imageBoxFit;
  Color? backgroundColor;

  ImageModel({
    this.image,
    this.brand,
    this.imageBoxFit,
    this.backgroundColor,
  });
}
