import 'dart:io';
import 'dart:ui';

import 'package:animated_svg/animated_svg.dart';
import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/common/my_dialog.dart';
import 'package:image_water_marker/common/my_tool_tip.dart';
import 'package:image_water_marker/controller/edit_image_controller.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/models/image_model.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/my_color_picker.dart';

class GridViewItem extends StatefulWidget {
  final ImageModel model;
  final int imageIndex;
  const GridViewItem({required this.model, required this.imageIndex, super.key});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  late SvgController svgController;
  late double height;
  late bool isExpand;
  late double opacity;
  final ValueNotifier<Color?> hoveredColor = ValueNotifier<Color?>(null);
  @override
  void initState() {
    svgController = AnimatedSvgController();
    height = 360;
    isExpand = false;
    opacity = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (settingClr) {
      return AnimatedContainer(
        width: 300,
        height: height,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: myGrey[700]!,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: myGrey[600],
                                  boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 6, color: myOrange[300]!.withOpacity(0.4))]),
                              child: MyToolTip(
                                message: 'Edit Photo',
                                child: AnimatedSvg(
                                  duration: const Duration(milliseconds: 300),
                                  onTap: () {
                                    isExpand = !isExpand;
                                    setState(() {
                                      if (isExpand) {
                                        height = 450;
                                        opacity = 1;
                                      } else {
                                        height = 360;
                                        opacity = 0;
                                      }

                                      svgController.isCompleted ? svgController.reverse() : svgController.forward();
                                    });
                                  },
                                  controller: svgController,
                                  children: [
                                    SvgPicture.asset(
                                      'svgs/edit.svg',
                                      colorFilter: ColorFilter.mode(myOrange[100]!, BlendMode.srcIn),
                                    ),
                                    SvgPicture.asset(
                                      'svgs/back.svg',
                                      colorFilter: ColorFilter.mode(myOrange[100]!, BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                myDialog(
                                    title: 'Deleted item ?',
                                    yes: () {
                                      Get.find<EditImageController>().removeImage(widget.imageIndex);
                                      Get.back();
                                    },
                                    no: Get.back);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 6, color: myRed[300]!.withOpacity(0.4))],
                                  color: myGrey[600],
                                ),
                                child: MyToolTip(
                                  message: "Remove Photo",
                                  child: SvgPicture.asset(
                                    'svgs/remove.svg',
                                    colorFilter: ColorFilter.mode(myRed[300]!, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: opacity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 300,
                              height: 40,
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                WidgetRadioGroup(
                                    iconTye: IconType.svgAsset,
                                    activeIconColor: Colors.cyan,
                                    deactivateIconColor: myGrey[400],
                                    backgroundColor: myGrey[700],
                                    activeShadow: [
                                      BoxShadow(offset: const Offset(0, 3), color: myGreen[800]!, blurRadius: 7),
                                    ],
                                    toolTipDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: myGrey[800],
                                    ),
                                    verticalOffset: -40,
                                    direction: Axis.horizontal,
                                    itemMargin: const EdgeInsets.symmetric(horizontal: 8),
                                    activeDefault: 1,
                                    data: [
                                      RadioData(iconPath: 'svgs/fill.svg', value: BoxFit.fill, toolTipText: 'Fill'),
                                      RadioData(iconPath: 'svgs/contain.svg', value: BoxFit.contain, toolTipText: "Contain"),
                                      RadioData(iconPath: 'svgs/cover.svg', value: BoxFit.cover, toolTipText: "Cover"),
                                      RadioData(iconPath: 'svgs/fill_width.svg', value: BoxFit.fitWidth, toolTipText: "Fill Width"),
                                      RadioData(iconPath: 'svgs/fill_height.svg', value: BoxFit.fitHeight, toolTipText: 'Fill Height'),
                                    ],
                                    onRadioClick: (value, index) {
                                      setState(() {
                                        widget.model.imageBoxFit = value;
                                      });
                                    })
                              ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyToolTip(
                                  message: 'Color plat',
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      child: SvgPicture.asset(
                                        'svgs/color_plat.svg',
                                        colorFilter: ColorFilter.mode(
                                          myGrey[300]!,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      onTap: () {
                                        colorPlatDialog();
                                      },
                                    ),
                                  ),
                                ),
                                MyToolTip(
                                  message: 'Eye Color',
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: MyColorPicker(
                                      onColor: (value) {
                                        setState(() {
                                          widget.model.backgroundColor = value;
                                        });
                                      },
                                      widget: Container(
                                        color: myGrey[700],
                                        child: SvgPicture.asset(
                                          'svgs/color_picker.svg',
                                          colorFilter: ColorFilter.mode(
                                            myGrey[300]!,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<EditImageController>(
                builder: (imageClr) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16.0,
                      ),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            settingClr.getImageBoarderRadius,
                          ),
                          color: widget.model.backgroundColor,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(settingClr.getImageBoarderRadius),
                                child: Image.file(
                                  widget.model.image!,
                                  width: 300,
                                  height: 300,
                                  fit: widget.model.imageBoxFit,
                                ),
                              ),
                            ),
                            settingClr.hasShowBrands
                                ? Positioned.fill(
                                    top: 16,
                                    child: Align(
                                      alignment: settingClr.getBusinessLogoAlignment,
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                          child: Container(
                                            width: 60,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  width: settingClr.getRightBusinessBoarderWidth,
                                                  color: const Color(0xFFFDBCC7),
                                                ),
                                                left: BorderSide(
                                                  width: settingClr.getLeftBusinessBoarderWidth,
                                                  color: const Color(0xFFFDBCC7),
                                                ),
                                                top: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFFDBCC7),
                                                ),
                                                bottom: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFFDBCC7),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: SvgPicture.file(settingClr.getLogoImage),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            imageClr.isBrandSelected
                                ? Positioned.fill(
                                    bottom: 16,
                                    child: Align(
                                      alignment: settingClr.getBrandsLogoAlignment,
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                          child: Container(
                                            width: 60,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  width: settingClr.getRightBrandBoarderWidth,
                                                  color: const Color(0xFFFDBCC7),
                                                ),
                                                left: BorderSide(
                                                  width: settingClr.getLeftBrandBoarderWidth,
                                                  color: const Color(0xFFFDBCC7),
                                                ),
                                                top: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFFDBCC7),
                                                ),
                                                bottom: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFFDBCC7),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: SvgPicture.file(
                                                File(
                                                  imageClr.getBrandFilePath,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            settingClr.isWaterMarkSelect
                                ? Align(
                                    alignment: settingClr.getWaterMarkAlignment,
                                    child: Opacity(
                                      opacity: settingClr.getWaterMarkOpacity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.file(
                                          settingClr.getWaterMarkFile,
                                          fit: settingClr.getWaterMarkBoxFit,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    });
    // child: const ImageEditControlPanel());
  }

  void colorPlatDialog() {
    Color selectedColor = const Color(0x00000fff);
    Get.dialog(
        Dialog(
          elevation: 0,
          child: ColorPicker(
            onColorSelected: (color) {
              selectedColor = color;
            },
            selectedColor: Colors.white,
            config: const ColorPickerConfig(enableLibrary: false, enableEyePicker: false, enableOpacity: true),
            onClose: () {
              setState(() {
                widget.model.backgroundColor = selectedColor;
              });
              Get.back();
            },
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.transparent);
  }
}
