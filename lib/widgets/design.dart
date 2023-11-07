import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/utils/colors.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Water Mark box fit',
              style: GoogleFonts.karla(fontSize: 16, color: myGrey[400]),
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
              color: myGrey[700], borderRadius: BorderRadius.circular(13)),
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
              style: GoogleFonts.karla(fontSize: 16, color: myGrey[400]),
            ),
          ),
        ),
        WidgetRadioGroup(
          alignment: WrapAlignment.spaceBetween,
          direction: Axis.horizontal,
          activeDefault: 1,
          itemMargin: const EdgeInsets.symmetric(horizontal: 8),
          iconTye: IconType.svgAsset,
          deactivateIconColor: myGrey[400],
          toolTipDecoration: BoxDecoration(
              color: myGrey[700], borderRadius: BorderRadius.circular(13)),
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
              'Product brand position',
              style: GoogleFonts.karla(fontSize: 16, color: myGrey[400]),
            ),
          ),
        ),
        WidgetRadioGroup(
          alignment: WrapAlignment.spaceBetween,
          direction: Axis.horizontal,
          activeDefault: 1,
          itemMargin: const EdgeInsets.symmetric(horizontal: 8),
          iconTye: IconType.svgAsset,
          deactivateIconColor: myGrey[400],
          toolTipDecoration: BoxDecoration(
              color: myGrey[700], borderRadius: BorderRadius.circular(13)),
          verticalOffset: -44,
          activeIconColor: Colors.cyan.withOpacity(0.7),
          onRadioClick: (fit) {},
          data: [
            RadioData(
                iconPath: 'svgs/top_right.svg',
                value: Alignment.topCenter,
                toolTipText: 'Top Right'),
            RadioData(
                iconPath: 'svgs/top_left.svg',
                value: Alignment.center,
                toolTipText: 'Top Left'),
            RadioData(
                iconPath: 'svgs/bottom_right.svg',
                value: Alignment.bottomCenter,
                toolTipText: 'Bottom Right'),
            RadioData(
                iconPath: 'svgs/bottom_left.svg',
                value: Alignment.bottomCenter,
                toolTipText: 'Bottom Left'),
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
              'Your business logo position',
              style: GoogleFonts.karla(fontSize: 16, color: myGrey[400]),
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
              color: myGrey[700], borderRadius: BorderRadius.circular(13)),
          verticalOffset: -44,
          activeIconColor: Colors.cyan.withOpacity(0.7),
          onRadioClick: (fit) {},
          data: [
            RadioData(
                iconPath: 'svgs/top_right.svg',
                value: Alignment.topCenter,
                toolTipText: 'Top Right'),
            RadioData(
                iconPath: 'svgs/top_left.svg',
                value: Alignment.center,
                toolTipText: 'Top Left'),
            RadioData(
                iconPath: 'svgs/bottom_right.svg',
                value: Alignment.bottomCenter,
                toolTipText: 'Bottom Right'),
            RadioData(
                iconPath: 'svgs/bottom_left.svg',
                value: Alignment.bottomCenter,
                toolTipText: 'Bottom Left'),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
