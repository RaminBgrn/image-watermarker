import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_water_marker/models/config_file_model.dart';
import 'package:path_provider/path_provider.dart';

class ConfigFileController extends GetxController {
  String fileDire = Platform.isWindows
      ? Platform.environment['APPDATA']!
      : Directory.current.path;
  String _defaultOutputPath = "";
  String get getDefaultOutputPath => _defaultOutputPath;

  Future<Map<String, dynamic>> readData() async {
    try {
      File configFile = File("$fileDire/data/config.json");
      Map<String, dynamic> decoderConfigFile =
          jsonDecode(configFile.readAsStringSync());
      return decoderConfigFile;
    } catch (e) {
      return {};
    }
  }

  void updateConfigFile({required ConfigFileModel model}) async {
    ConfigFileModel updateModel = ConfigFileModel();
    Map<String, dynamic> configMap = await readData();
    configMap = updateModel.toJson(model);
    File updateConfigFile = File("$fileDire/data/config.json");
    updateConfigFile.writeAsStringSync(jsonEncode(configMap));
  }

  dynamic getSingleData({required String key}) async {
    Map<String, dynamic> jsonMap = await readData();
    return jsonMap[key];
  }

  void checkConfigFile() async {
    Directory('$fileDire/data/water mark').createSync(recursive: true);
    Directory('$fileDire/data/products logos').createSync(recursive: true);
    Directory('$fileDire/data/business logo').createSync(recursive: true);
    Directory outPutPath = await getApplicationDocumentsDirectory();
    Directory('${outPutPath.absolute.path}/Water Mark')
        .createSync(recursive: true);
    _defaultOutputPath = "${outPutPath.absolute.path}/Water Mark";
    File configFile = File("$fileDire/data/config.json");
    if (!await configFile.exists()) {
      configFile.create();
      Map<String, dynamic> configData = {
        'business_logo': "",
        'business_logo_position': "Alignment.topRight",
        'business_logo_selected_index': 0,
        'show_business_logo': true,
        'brands_logo': [],
        'brands_position': "Alignment.bottomLeft",
        'brands_selected_index': 2,
        'show_brands_logo': true,
        'water_mark': "",
        "water_mark_box_fit_index": 0,
        'water_mark_box_fit': "BoxFit.contain",
        "water_mark_position_index": 1,
        'water_mark_position': "Alignment.center",
        'water_mark_opacity': 0.5,
        'image_border_radius': 8.0,
      };
      configFile.writeAsStringSync(jsonEncode(configData));
    }
    // readData();
  }
}
