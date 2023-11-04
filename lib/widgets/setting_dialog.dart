import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/utils/colors.dart';

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
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Files Configuration',
                                  style: GoogleFonts.karla(
                                      fontSize: 22, color: myGrey[300]),
                                ),
                                TextFieldWithTitle(
                                  controller: TextEditingController(),
                                  title: "",
                                  isReadOnly: true,
                                  textFieldHint: 'your business logo',
                                ),
                                TextFieldWithTitle(
                                  controller: TextEditingController(),
                                  title: "",
                                  textFieldHint: "water mark image file",
                                  isReadOnly: true,
                                ),
                                TextFieldWithTitle(
                                  controller: TextEditingController(),
                                  title: "",
                                  isReadOnly: true,
                                  textFieldHint: 'brands folder file(s)',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 0.5,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                        Colors.transparent,
                                        myGrey[400]!,
                                        myGrey[300]!,
                                        myGrey[400]!,
                                        Colors.transparent,
                                      ])),
                                ),
                                Text(
                                  'Design',
                                  style: GoogleFonts.karla(
                                      fontSize: 22, color: myGrey[300]),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Water Mark box fit',
                                      style: GoogleFonts.karla(
                                          fontSize: 16, color: myGrey[400]),
                                    ),
                                  ),
                                ),
                                WidgetRadioGroup(
                                  alignment: WrapAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  activeDefault: 0,
                                  itemMargin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  iconTye: IconType.svgAsset,
                                  deactivateIconColor: myGrey[400],
                                  toolTipDecoration: BoxDecoration(
                                      color: myGrey[700],
                                      borderRadius: BorderRadius.circular(13)),
                                  verticalOffset: -44,
                                  activeIconColor: Colors.cyan.withOpacity(0.7),
                                  onRadioClick: (fit) {},
                                  data: [
                                    RadioData(
                                        iconPath: 'svgs/fill.svg',
                                        value: BoxFit.fill,
                                        toolTipText: 'Fill'),
                                    RadioData(
                                        iconPath: 'svgs/contain.svg',
                                        value: BoxFit.contain,
                                        toolTipText: 'Contain'),
                                    RadioData(
                                        iconPath: 'svgs/cover.svg',
                                        value: BoxFit.cover,
                                        toolTipText: 'Cover'),
                                    RadioData(
                                        iconPath: 'svgs/fill_height.svg',
                                        value: BoxFit.fitHeight,
                                        toolTipText: 'Fit Height'),
                                    RadioData(
                                        iconPath: 'svgs/fill_width.svg',
                                        value: BoxFit.fitWidth,
                                        toolTipText: 'Fit Width'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Water mark logo position',
                                      style: GoogleFonts.karla(
                                          fontSize: 16, color: myGrey[400]),
                                    ),
                                  ),
                                ),
                                WidgetRadioGroup(
                                  alignment: WrapAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  activeDefault: 1,
                                  itemMargin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  iconTye: IconType.svgAsset,
                                  deactivateIconColor: myGrey[400],
                                  toolTipDecoration: BoxDecoration(
                                      color: myGrey[700],
                                      borderRadius: BorderRadius.circular(13)),
                                  verticalOffset: -44,
                                  activeIconColor: Colors.cyan.withOpacity(0.7),
                                  onRadioClick: (fit) {},
                                  data: [
                                    RadioData(
                                        iconPath: 'svgs/top.svg',
                                        value: Alignment.topCenter,
                                        toolTipText: 'Top Center'),
                                    RadioData(
                                        iconPath: 'svgs/center.svg',
                                        value: Alignment.center,
                                        toolTipText: 'Center'),
                                    RadioData(
                                        iconPath: 'svgs/bottom.svg',
                                        value: Alignment.bottomCenter,
                                        toolTipText: 'Bottom Center'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Water mark logo position',
                                      style: GoogleFonts.karla(
                                          fontSize: 16, color: myGrey[400]),
                                    ),
                                  ),
                                ),
                                WidgetRadioGroup(
                                  alignment: WrapAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  activeDefault: 1,
                                  itemMargin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  iconTye: IconType.svgAsset,
                                  deactivateIconColor: myGrey[400],
                                  toolTipDecoration: BoxDecoration(
                                      color: myGrey[700],
                                      borderRadius: BorderRadius.circular(13)),
                                  verticalOffset: -44,
                                  activeIconColor: Colors.cyan.withOpacity(0.7),
                                  onRadioClick: (fit) {},
                                  data: [
                                    RadioData(
                                        iconPath: 'svgs/right_top.svg',
                                        value: Alignment.topCenter,
                                        toolTipText: 'Top Center'),
                                    RadioData(
                                        iconPath: 'svgs/left_top.svg',
                                        value: Alignment.center,
                                        toolTipText: 'Center'),
                                    RadioData(
                                        iconPath: 'svgs/right_bottom.svg',
                                        value: Alignment.bottomCenter,
                                        toolTipText: 'Bottom Center'),
                                    RadioData(
                                        iconPath: 'svgs/left_bottom.svg',
                                        value: Alignment.bottomCenter,
                                        toolTipText: 'Bottom Center'),
                                  ],
                                )
                              ],
                            ),
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
