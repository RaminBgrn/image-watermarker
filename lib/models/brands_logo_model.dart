class BrandsLogoModel {
  String? title;
  String? imagePath;

  BrandsLogoModel({this.title, this.imagePath});

  BrandsLogoModel.formJson(Map<String, String> json) {
    title = json['brand_title'];
    imagePath = json['image_path'];
  }
}
