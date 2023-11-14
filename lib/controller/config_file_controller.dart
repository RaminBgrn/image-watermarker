import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_water_marker/models/config_file_model.dart';

class ConfigFileController extends GetxController {
  ConfigFileModel _model = ConfigFileModel();
  ConfigFileModel get getConfigModel => _model;

  Future<Map<String, dynamic>> readData() async {
    String fileDire = Directory.current.path;
    File configFile = File("$fileDire/data/config.json");
    Map<String, dynamic> decoderConfigFile =
        jsonDecode(configFile.readAsStringSync());
    _model = ConfigFileModel.fromJson(decoderConfigFile);
    return decoderConfigFile;
  }

  void checkConfigFile() async {
    String path = Directory.current.path;
    Directory('$path/data').createSync(recursive: true);
    File configFile = File("$path/data/config.json");
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
        'image_border_radius': 4.0,
      };
      configFile.writeAsStringSync(jsonEncode(configData));
      return;
    }
  }

  void updateConfigFile() {}
}
