import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImportImageController extends GetxController {
  final String _applicationDataPath = Directory.current.path;

  Future<File> getImageFromStorage(String path) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? selectedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedFile == null) throw Exception;
    File convertedFile = File(selectedFile.path);
    convertedFile.copySync(
        "$_applicationDataPath/data/$path/${basename(convertedFile.path)}");
    return File(selectedFile.path);
  }
}
