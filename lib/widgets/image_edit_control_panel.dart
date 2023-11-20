import 'package:flutter/material.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/utils/colors.dart';

class ImageEditControlPanel extends StatelessWidget {
  const ImageEditControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: myGrey[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          WidgetRadioGroup(
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            activeDefault: 0,
            itemMargin: const EdgeInsets.symmetric(horizontal: 8),
            iconTye: IconType.svgAsset,
            deactivateIconColor: myGrey[400],
            toolTipDecoration: BoxDecoration(
                color: myGrey[700], borderRadius: BorderRadius.circular(13)),
            verticalOffset: -44,
            activeIconColor: Colors.cyan.withOpacity(0.7),
            onRadioClick: (fit, index) {},
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
    );
  }
}
