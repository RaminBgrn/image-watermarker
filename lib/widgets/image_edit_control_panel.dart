import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          CustomRadioButton(
            buttonLables: const [
              'Fill',
              'Cover',
              'Contain',
              'Fill Withd',
              'Fill Hight',
              'none'
            ],
            buttonValues: const [
              BoxFit.fill,
              BoxFit.cover,
              BoxFit.contain,
              BoxFit.fitWidth,
              BoxFit.fitHeight,
              BoxFit.none
            ],
            radioButtonValue: (value) {},
            unSelectedColor: myGrey[900]!.withOpacity(0.4),
            selectedColor: myOrange[900]!.withOpacity(0.4),
            elevation: 0,
            enableButtonWrap: true,
            horizontal: false,
            selectedBorderColor: Colors.transparent,
            unSelectedBorderColor: Colors.transparent,
            margin: const EdgeInsets.all(6),
            autoWidth: true,
            radius: 8,
            wrapAlignment: WrapAlignment.center,
            buttonTextStyle: ButtonTextStyle(
              textStyle: GoogleFonts.karla(
                fontWeight: FontWeight.w500,
                color: myGrey[200],
              ),
              selectedColor: myGrey[300]!,
              unSelectedColor: myGrey[200]!,
            ),
          )
        ],
      ),
    );
  }
}
