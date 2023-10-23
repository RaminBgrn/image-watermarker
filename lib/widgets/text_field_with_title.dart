import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/custom_text_field.dart';

class TextFieldWithTitle extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final double? textFieldHeith;
  final double? textFieldWidth;
  final String? textFieldHint;
  final bool? isReadOnly;
  final Color? borderColor;

  const TextFieldWithTitle(
      {required this.controller,
      required this.title,
      this.textFieldWidth,
      this.textFieldHeith,
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
                    height: textFieldHeith,
                    width: textFieldWidth,
                    hint: textFieldHint,
                    focusBorderColor: borderColor,
                    isReadOnly: isReadOnly,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                    onPressed: () {},
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
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
