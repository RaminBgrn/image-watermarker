import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';

class MyToolTip extends StatelessWidget {
  final String message;
  final Widget child;
  const MyToolTip({required this.message, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: message,
        textStyle: GoogleFonts.karla(color: myGrey[200]),
        verticalOffset: -45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: myGrey[900],
        ),
        child: child);
  }
}
