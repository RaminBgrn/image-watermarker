import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/screens_controller.dart';
import 'package:image_water_marker/utils/colors.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late SvgController _controller;

  @override
  void initState() {
    _controller = AnimatedSvgController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: () {},
      icon: AnimatedSvg(
        onTap: () {
          !_controller.isCompleted ? Get.find<ScreenController>().moveToSetting() : Get.find<ScreenController>().moveToGrid();
        },
        controller: _controller,
        children: [
          SvgPicture.asset(
            'svgs/setting.svg',
            colorFilter: ColorFilter.mode(
              myOrange[300]!,
              BlendMode.srcIn,
            ),
          ),
          SvgPicture.asset(
            'svgs/back_setting.svg',
            colorFilter: ColorFilter.mode(
              myRed[300]!,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
