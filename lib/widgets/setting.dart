import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/screens_controller.dart';
import 'package:image_water_marker/utils/colors.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: () {
        Get.find<ScreenController>().moveToSetting();
      },
      icon: Icon(
        Icons.settings,
        color: myGrey[400],
      ),
    );
  }
}
