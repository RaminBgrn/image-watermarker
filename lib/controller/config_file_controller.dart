import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_water_marker/models/config_file_model.dart';

class ConfigFileController extends GetxController {
  ConfigFileModel _model = ConfigFileModel();
  String fileDire = Directory.current.path;
  ConfigFileModel get getConfigModel => _model;

  Future<Map<String, dynamic>> readData() async {
    File configFile = File("$fileDire/data/config.json");
    Map<String, dynamic> decoderConfigFile =
        jsonDecode(configFile.readAsStringSync());
    _model = ConfigFileModel.fromJson(decoderConfigFile);
    return decoderConfigFile;
  }

  void updateConfigFile({required String key, required dynamic data}) async {
    Map<String, dynamic> configMap = await readData();
    configMap[key] = data;
    File updateConfigFile = File("$fileDire/data/config.json");
    updateConfigFile.writeAsStringSync(jsonEncode(configMap));
  }

  void checkConfigFile() async {
    Directory('$fileDire/data/water mark').createSync(recursive: true);
    Directory('$fileDire/data/products logos').createSync(recursive: true);
    Directory('$fileDire/data/business logo').createSync(recursive: true);

    File configFile = File("$fileDire/data/config.json");
    if (!await configFile.exists()) {
      configFile.create();
      Map<String, dynamic> configData = {
        'business_logo': "",
        'brands_logo': "",
        'water_mark': "",
        'water_mark_box_fit': "",
        'water_mark_logo_position': "",
        'product_brands_position': "",
        'business_logo_position': "",
        'water_mark_opacity': 0.5,
        'boarder_color': "",
        'image_border_radius': 8.0,
      };
      configFile.writeAsStringSync(jsonEncode(configData));
    }
    readData();
  }
}
