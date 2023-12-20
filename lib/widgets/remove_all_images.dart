import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/edit_image_controller.dart';
import 'package:image_water_marker/utils/colors.dart';

class RemoveAllImages extends StatelessWidget {
  const RemoveAllImages({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GestureDetector(
          onTap: () async {
            Get.find<EditImageController>().removeAllImages();
          },
          child: SvgPicture.asset(
            'svgs/remove_all.svg',
            colorFilter: ColorFilter.mode(
              myRed[300]!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
