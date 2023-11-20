import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:path/path.dart';

class ImportImageController extends GetxController {
  late ImagePicker imagePicker;

  @override
  void onInit() {
    imagePicker = ImagePicker();
    super.onInit();
  }

  final String _applicationDataPath = Directory.current.path;
  Future<File> getImageFromStorage(String path) async {
    XFile? selectedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedFile == null) throw Exception;
    File convertedFile = File(selectedFile.path);
    convertedFile.copySync(
        "$_applicationDataPath/data/$path/${basename(convertedFile.path)}");
    return File(selectedFile.path);
  }

  Future<List<File>> getMultiImage() async {
    List<XFile> selectedMultiImages = await imagePicker.pickMultiImage();
    List<File> convertedBrandsImage = [];
    if (selectedMultiImages.isEmpty) throw Exception();
    for (XFile file in selectedMultiImages) {
      convertedBrandsImage.add(File(file.path));
    }
    Get.find<SettingController>()
        .convertBrandsDataToModel(convertedBrandsImage);
    _copeAllBrandsInDataFolder(convertedBrandsImage);
    return convertedBrandsImage;
  }

  void _copeAllBrandsInDataFolder(List<File> images) {
    for (int i = 0; i < images.length; i++) {
      images[i].copySync(
          "$_applicationDataPath/data/products logos/${basename(images[i].path)}");
    }
  }
}
