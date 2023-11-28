import 'package:flutter/material.dart';

class SettingModel {
  String? businessLogo;
  String? waterMarkLogo;
  Alignment? waterMarkAlign;
  Alignment? brandPosition;
  Alignment? businessLogoPosition;
  BoxFit? waterMarkBoxFit;
  double? watermarkOpacity;
  double? imageBorderRadius;
  Color? logoBorderColor;
  List<String>? brandsLogo;

  SettingModel.fromJson(Map<String, dynamic> json) {
    businessLogo = json['business_logo'];
    brandsLogo = json['brands_logo'];
    waterMarkLogo = json['water_mark'];
    waterMarkBoxFit = json['water_mark_box_fit'];
    waterMarkAlign = json['water_mark_log_position'];
    brandPosition = json['product_brand_position'];
    businessLogoPosition = json['business_logo_position'];
    logoBorderColor = json['boarder_color'];
    imageBorderRadius = json['image_border_radius'];
  }

  SettingModel(
      {this.brandPosition,
      this.waterMarkLogo,
      this.waterMarkAlign,
      this.businessLogo,
      this.brandsLogo,
      this.imageBorderRadius,
      this.waterMarkBoxFit,
      this.logoBorderColor,
      this.businessLogoPosition,
      this.watermarkOpacity});
}
