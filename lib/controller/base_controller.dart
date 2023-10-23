import 'package:get/get.dart';
import 'package:image_water_marker/controller/make_out_put_controller.dart';
import 'package:image_water_marker/controller/setting_controller.dart';

class BaseController extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
    Get.put(MakeOutPutController());
  }
}
