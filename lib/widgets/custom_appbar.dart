import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/controller/make_out_put_controller.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/logo_button.dart';
import 'package:image_water_marker/widgets/custom_text_field.dart';
import 'package:image_water_marker/widgets/setting.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.only(
        top: 4,
        left: 6,
        right: 6,
        bottom: 4,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: myGrey[400]!.withOpacity(
            0.5,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
          child: Container(
            width: double.infinity,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: myGrey[400]!.withOpacity(0.1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                const Setting(),
                CustomTextField(
                  controller: Get.find<MakeOutPutController>()
                      .getSaveFileNameController,
                ),
                const LogoButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
