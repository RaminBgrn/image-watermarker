import 'package:get/get.dart';
import 'package:image_water_marker/controller/config_file_controller.dart';
import 'package:image_water_marker/controller/edit_image_controller.dart';
import 'package:image_water_marker/controller/import_image_controller.dart';
import 'package:image_water_marker/controller/screens_controller.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/controller/water_mark_controller.dart';

class BaseController extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
    Get.put(EditImageController());
    Get.put(ImportImageController());
    Get.put(ScreenController());
    Get.put(ConfigFileController());
    Get.put(WaterMarkController());
  }
}
