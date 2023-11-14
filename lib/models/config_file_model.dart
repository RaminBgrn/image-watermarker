import 'dart:ui';

class ConfigFileModel {
  String? businessLogo;
  String? brandsLogo;
  String? waterMarkImage;
  String? waterMarkImageBoxFit;
  String? waterMarkLogoPosition;
  String? productBrandsPosition;
  String? businessLogoPosition;
  double? waterMarkOpacity;
  String? borderColor;
  double? imageBorderRadius;

  ConfigFileModel({
    this.borderColor,
    this.brandsLogo,
    this.businessLogo,
    this.businessLogoPosition,
    this.imageBorderRadius,
    this.productBrandsPosition,
    this.waterMarkImage,
    this.waterMarkImageBoxFit,
    this.waterMarkLogoPosition,
    this.waterMarkOpacity,
  });

  ConfigFileModel.fromJson(Map<String, dynamic> json) {
    businessLogo = json['business_logo'];
    brandsLogo = json['brands_logo'];
    waterMarkImage = json['water_mark'];
    waterMarkImageBoxFit = json['water_mark_box_fit'];
    waterMarkLogoPosition = json['water_mark_logo_position'];
    productBrandsPosition = json['product_brands_position'];
    businessLogoPosition = json['business_logo_position'];
    waterMarkOpacity = json['water_mark_opacity'];
    borderColor = json['boarder_color'];
    imageBorderRadius = json['image_border_radius'];
  }
}
