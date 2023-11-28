import 'dart:io';

import 'package:flutter/material.dart';

class ImageModel {
  File? image;
  BoxFit? imageBoxFit;
  Color? backgroundColor;

  ImageModel({
    this.image,
    this.imageBoxFit,
    this.backgroundColor,
  });
}
