import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/utils/colors.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.35,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Water Mark box fit',
                    style: GoogleFonts.karla(fontSize: 16, color: myGrey[300]),
                  ),
                ),
              ),
              WidgetRadioGroup(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                activeDefault: Get.find<SettingController>()
                    .getSelectedWaterMarkBoxFitIndex,
                itemMargin: const EdgeInsets.symmetric(horizontal: 8),
                iconTye: IconType.svgAsset,
                deactivateIconColor: myGrey[400],
                toolTipDecoration: BoxDecoration(
                    color: myGrey[700],
                    borderRadius: BorderRadius.circular(13)),
                verticalOffset: -44,
                activeIconColor: Colors.cyan.withOpacity(0.7),
                onRadioClick: (fit, index) {
                  Get.find<SettingController>().setWaterBoxFit(fit, index);
                },
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Water mark logo position',
                    style: GoogleFonts.karla(fontSize: 16, color: myGrey[300]),
                  ),
                ),
              ),
              WidgetRadioGroup(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                activeDefault:
                    Get.find<SettingController>().getSelectedWatermarkPosition,
                itemMargin: const EdgeInsets.symmetric(horizontal: 8),
                iconTye: IconType.svgAsset,
                deactivateIconColor: myGrey[400],
                toolTipDecoration: BoxDecoration(
                    color: myGrey[700],
                    borderRadius: BorderRadius.circular(13)),
                verticalOffset: -44,
                activeIconColor: Colors.cyan.withOpacity(0.7),
                onRadioClick: (fit, index) {
                  Get.find<SettingController>()
                      .setWaterMarkAlignment(fit, index);
                },
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product brand position',
                    style: GoogleFonts.karla(fontSize: 16, color: myGrey[300]),
                  ),
                ),
              ),
              WidgetRadioGroup(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                activeDefault: 2,
                itemMargin: const EdgeInsets.symmetric(horizontal: 8),
                iconTye: IconType.svgAsset,
                deactivateIconColor: myGrey[400],
                toolTipDecoration: BoxDecoration(
                    color: myGrey[700],
                    borderRadius: BorderRadius.circular(13)),
                verticalOffset: -44,
                activeIconColor: Colors.cyan.withOpacity(0.7),
                onRadioClick: (align, index) {
                  Get.find<SettingController>()
                      .changeBrandsLogoAlignment(align, index);
                },
                data: [
                  RadioData(
                      iconPath: 'svgs/top_right.svg',
                      value: Alignment.topRight,
                      toolTipText: 'Top Right'),
                  RadioData(
                      iconPath: 'svgs/bottom_right.svg',
                      value: Alignment.bottomRight,
                      toolTipText: 'Bottom Right'),
                  RadioData(
                      iconPath: 'svgs/bottom_left.svg',
                      value: Alignment.bottomLeft,
                      toolTipText: 'Bottom Left'),
                  RadioData(
                      iconPath: 'svgs/top_left.svg',
                      value: Alignment.topLeft,
                      toolTipText: 'Top Left'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your business logo position',
                    style: GoogleFonts.karla(fontSize: 16, color: myGrey[300]),
                  ),
                ),
              ),
              WidgetRadioGroup(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                activeDefault: 0,
                itemMargin: const EdgeInsets.symmetric(horizontal: 8),
                iconTye: IconType.svgAsset,
                deactivateIconColor: myGrey[400],
                toolTipDecoration: BoxDecoration(
                    color: myGrey[700],
                    borderRadius: BorderRadius.circular(13)),
                verticalOffset: -44,
                activeIconColor: Colors.cyan.withOpacity(0.7),
                onRadioClick: (businessAlign, index) {
                  Get.find<SettingController>()
                      .changeBusinessLogoAlignment(businessAlign, index);
                },
                data: [
                  RadioData(
                      iconPath: 'svgs/top_right.svg',
                      value: Alignment.topRight,
                      toolTipText: 'Top Right'),
                  RadioData(
                      iconPath: 'svgs/bottom_right.svg',
                      value: Alignment.bottomRight,
                      toolTipText: 'Bottom Right'),
                  RadioData(
                      iconPath: 'svgs/bottom_left.svg',
                      value: Alignment.bottomLeft,
                      toolTipText: 'Bottom Left'),
                  RadioData(
                      iconPath: 'svgs/top_left.svg',
                      value: Alignment.topLeft,
                      toolTipText: 'Top Left'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          GetBuilder<SettingController>(builder: (clr) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      "Water mark image opacity",
                      style: GoogleFonts.karla(
                        fontSize: 16,
                        color: myGrey[300],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 0.5,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 5,
                            elevation: 0.2,
                            pressedElevation: 1),
                      ),
                      child: Slider(
                        value: clr.getWaterMarkOpacity,
                        max: 1.0,
                        min: 0.0,
                        inactiveColor: myGrey[400],
                        activeColor: Colors.cyan,
                        onChangeStart: (value) {},
                        onChangeEnd: (value) {},
                        onChanged: (opacity) {
                          clr.setWaterMarkOpacity(opacity);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      clr.getWaterMarkOpacity.toStringAsFixed(2),
                      style:
                          GoogleFonts.karla(fontSize: 12, color: myGrey[300]),
                    ),
                  ),
                ],
              ),
            );
          }),
          GetBuilder<SettingController>(builder: (clr) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      "Image corner radius",
                      style: GoogleFonts.karla(
                        fontSize: 16,
                        color: myGrey[300],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 0.5,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 5,
                            elevation: 0.2,
                            pressedElevation: 1),
                      ),
                      child: Slider(
                        value: clr.getImageBoarderRadius,
                        max: 18.0,
                        min: 0.0,
                        inactiveColor: myGrey[400],
                        activeColor: Colors.cyan,
                        onChanged: (opacity) {
                          clr.setImageBoarderRadius(opacity);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      clr.getImageBoarderRadius.toStringAsFixed(2),
                      style:
                          GoogleFonts.karla(fontSize: 12, color: myGrey[300]),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
