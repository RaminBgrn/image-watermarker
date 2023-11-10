import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/custom_text_field.dart';

class TextFieldWithTitle extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final VoidCallback onTap;
  final VoidCallback? onClearTap;
  final double? textFieldHeight;
  final double? textFieldWidth;
  final String? textFieldHint;
  final bool? isReadOnly;
  final Color? borderColor;
  final Color? clearButtonColor;

  const TextFieldWithTitle(
      {required this.controller,
      required this.title,
      required this.onTap,
      this.onClearTap,
      this.textFieldWidth,
      this.clearButtonColor,
      this.textFieldHeight,
      this.textFieldHint,
      this.isReadOnly,
      this.borderColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.karla(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: myGrey[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: controller,
                    height: textFieldHeight,
                    width: textFieldWidth,
                    hint: textFieldHint,
                    focusBorderColor: borderColor,
                    isReadOnly: isReadOnly,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onClearTap,
                    child: SvgPicture.asset(
                      'svgs/close.svg',
                      colorFilter: ColorFilter.mode(
                          clearButtonColor ?? Colors.red, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: onTap,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(myGrey[500]!),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Text(
                    'Browse',
                    style: GoogleFonts.karla(
                      fontSize: 14,
                      color: myGrey[300],
                    ),
                  ),
                ),
                WidgetRadioGroup(
                    data: [RadioData(iconPath: 'svgs/back.svg', value: true)],
                    iconTye: IconType.svgAsset,
                    onRadioClick: (has) {
                      print(has);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
