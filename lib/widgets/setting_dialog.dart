import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/custom_text_field.dart';
import 'package:image_water_marker/widgets/text_field_with_title.dart';

void showSettingDialog() {
  Get.dialog(
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: 800,
            height: 600,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: myGrey[600]!,
                ),
                borderRadius: BorderRadius.circular(14),
                color: myGrey[800]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Settings',
                    style: GoogleFonts.karla(
                        fontWeight: FontWeight.bold,
                        color: myGrey[300],
                        fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFieldWithTitle(
                            controller: TextEditingController(),
                            title: "water mark image (png)",
                            textFieldHint: "water mark image path",
                            isReadOnly: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldWithTitle(
                            controller: TextEditingController(),
                            title: "product brand logo",
                            isReadOnly: true,
                            textFieldHint: 'brands folder path',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0)
                          ])),
                    ),
                    Expanded(
                      child: SizedBox(),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: myGrey[400]!.withOpacity(0.1));
}
