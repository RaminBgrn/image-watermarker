import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:path/path.dart';

class ImportImageController extends GetxController {
  XTypeGroup typeGroup = const XTypeGroup(
    label: 'images',
    extensions: <String>['svg'],
  );
  XTypeGroup selectImagesForWaterMark = const XTypeGroup(
    label: 'images',
    extensions: <String>[
      'png',
      'jpg',
      'jpeg',
      'wepb',
    ],
  );

  final String _applicationDataPath = Platform.isWindows
      ? Platform.environment['APPDATA']!
      : Directory.current.path;
  Future<File> getSingleSvg(String path) async {
    XFile? selectedFile =
        await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    if (selectedFile == null) throw Exception;
    File convertedFile = File(selectedFile.path);
    convertedFile.copySync(
        "$_applicationDataPath/data/$path/${basename(convertedFile.path)}");
    return File(selectedFile.path);
  }

  Future<List<File>> getMultiSvg() async {
    List<XFile> selectedMultiImages =
        await openFiles(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
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

  Future<List<File>> selectImageToWaterMark() async {
    List<XFile> selectedImages = await openFiles(
        acceptedTypeGroups: <XTypeGroup>[selectImagesForWaterMark]);
    if (selectedImages.isEmpty) throw Exception();
    List<File> convertedSelectedImages = [];
    for (XFile image in selectedImages) {
      convertedSelectedImages.add(File(image.path));
    }
    return convertedSelectedImages;
  }

  void _copeAllBrandsInDataFolder(List<File> images) {
    for (int i = 0; i < images.length; i++) {
      images[i].copySync(
          "$_applicationDataPath/data/products logos/${basename(images[i].path)}");
    }
  }
}
