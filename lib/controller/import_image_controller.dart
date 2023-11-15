import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImportImageController extends GetxController {
  bool _hasWaterMarkImage = false;
  bool get isWaterMarkSet => _hasWaterMarkImage;

  late File _waterMarkImage;
  File get getWaterMarkImage => _waterMarkImage;

  void setWaterMarkImage() async {
    ImagePicker picker = ImagePicker();

    XFile? waterMarkImage = await picker.pickImage(source: ImageSource.gallery);
    if (waterMarkImage != null) {
      _waterMarkImage = File(waterMarkImage.path);
      _hasWaterMarkImage = true;
    } else {
      _hasWaterMarkImage = false;
    }
  }

  void copyData(File file) {
    String applicationDataPath = Directory.current.path;
    File waterCopy = file.copySync(
        "$applicationDataPath/data/business logo/${basename(file.path)}");
    _waterMarkImage = File(waterCopy.path);
    update();
  }
}
