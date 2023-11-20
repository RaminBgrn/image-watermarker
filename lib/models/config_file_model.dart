import 'dart:convert';

import 'package:image_water_marker/models/brands_logo_model.dart';

class ConfigFileModel {
  String? businessLogo;
  List<BrandsLogoModel>? brandsLogo;
  String? waterMarkImage;
  String? waterMarkImageBoxFit;
  String? waterMarkLogoPosition;
  String? brandsPosition;
  String? businessLogoPosition;
  double? waterMarkOpacity;
  double? imageBorderRadius;
  int? businessLogoSelectedIndex;
  bool? showBusinessLogo;
  int? brandSelectedIndex;
  bool? showBrandsLogo;
  int? waterMarkPositionIndex;
  int? waterMarkBoxFitIndex;

  ConfigFileModel({
    this.businessLogo,
    this.businessLogoPosition,
    this.businessLogoSelectedIndex,
    this.showBusinessLogo,
    this.brandsLogo,
    this.brandsPosition,
    this.brandSelectedIndex,
    this.showBrandsLogo,
    this.waterMarkImage,
    this.waterMarkBoxFitIndex,
    this.waterMarkImageBoxFit,
    this.waterMarkPositionIndex,
    this.waterMarkLogoPosition,
    this.waterMarkOpacity,
    this.imageBorderRadius,
  });

  Map<String, dynamic> toJson(ConfigFileModel model) {
    BrandsLogoModel tempModel = BrandsLogoModel();
    Map<String, String> brands = {};
    if (model.brandsLogo != null) {
      for (BrandsLogoModel brand in model.brandsLogo!) {
        brands = tempModel.toJson(brand);
      }
    }
    return {
      'business_log': businessLogo,
      'business_logo_position': businessLogoPosition,
      'business_logo_selected_index': businessLogoSelectedIndex,
      'show_business_logo': showBusinessLogo,
      'brandsPosition': brandsPosition,
      'brands_selected_index': brandSelectedIndex,
      'show_brands_logo': showBrandsLogo,
      'water_mark': waterMarkImage,
      'water_mark_box_fit_index': waterMarkBoxFitIndex,
      'water_mark_box_fit': waterMarkImageBoxFit,
      'water_mark_position_index': waterMarkPositionIndex,
      'water_mark_logo_position': waterMarkLogoPosition,
      'water_mark_opacity': waterMarkOpacity,
      'image_border_radius': imageBorderRadius,
      'brands_logo': jsonEncode(brands),
    };
  }

  ConfigFileModel.fromJson(Map<String, dynamic> json) {
    businessLogo = json['business_logo'];
    businessLogoPosition = json['business_logo_position'];
    businessLogoSelectedIndex = json["business_logo_selected_index"];
    showBusinessLogo = json["show_business_logo"];
    brandsPosition = json["brands_position"];
    brandSelectedIndex = json["brands_selected_index"];
    showBrandsLogo = json["show_brands_logo"];
    waterMarkImage = json['water_mark'];
    waterMarkBoxFitIndex = json["water_mark_box_fit_index"];
    waterMarkImageBoxFit = json['water_mark_box_fit'];
    waterMarkPositionIndex = json["water_mark_position_index"];
    waterMarkLogoPosition = json['water_mark_logo_position'];
    waterMarkOpacity = json['water_mark_opacity'];
    imageBorderRadius = json['image_border_radius'];
    if (json['brands_logo'].length > 0) {
      for (int i = 0; i < json['brands_logo']; i++) {
        brandsLogo!.add(BrandsLogoModel.formJson(json['brands_logo'][i]));
      }
    }
  }
}
