import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? focusBorderColor;
  final String? hint;
  final bool? isReadOnly;
  final double? height;
  final double? width;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;

  const CustomTextField({
    required this.controller,
    this.focusBorderColor,
    this.height,
    this.maxLength,
    this.width,
    this.hint,
    this.isReadOnly,
    this.formatters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 280,
      height: height ?? 40,
      child: TextField(
        inputFormatters: formatters,
        controller: controller,
        maxLength: maxLength,
        cursorColor: myGrey[100],
        readOnly: isReadOnly ?? false,
        cursorOpacityAnimates: true,
        cursorRadius: const Radius.circular(12),
        cursorWidth: 1,
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.karla(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: myGrey[100],
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          hintText: hint ?? "Out put file name",
          hintStyle: GoogleFonts.karla(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: myGrey[400],
          ),
          filled: true,
          fillColor: myGrey[900],
          contentPadding: const EdgeInsets.all(2),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            gapPadding: 0,
            borderSide: BorderSide(
              width: 1,
              color: focusBorderColor ?? myOrange[800]!,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            gapPadding: 0,
            borderSide: BorderSide(
              width: 1,
              color: myOrange[800]!,
            ),
          ),
        ),
      ),
    );
  }
}
