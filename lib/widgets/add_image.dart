import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/water_mark_controller.dart';
import 'package:image_water_marker/utils/colors.dart';

class AddImage extends StatelessWidget {
  const AddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.find<WaterMarkController>().importImage();
        },
        child: SvgPicture.asset(
          'svgs/import.svg',
          colorFilter: ColorFilter.mode(
            myPurple[300]!,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
