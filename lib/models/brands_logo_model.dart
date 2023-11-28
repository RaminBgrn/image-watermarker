class BrandsLogoModel {
  String? title;
  String? imagePath;

  BrandsLogoModel({this.title, this.imagePath});

  BrandsLogoModel.formJson(Map<String, dynamic> json) {
    title = json['brand_title'];
    imagePath = json['image_path'];
  }

  Map<String, String> toJson(BrandsLogoModel model) {
    return {
      'brand_title': model.title ?? '',
      'image_path': model.imagePath ?? '',
    };
  }
}
