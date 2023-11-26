import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/utils/utils_method.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            UtilsMethods.urlLauncher('rammin.ir');
          },
          child: Text(
            'Ramin BGrn',
            style: GoogleFonts.pacifico(
                fontWeight: FontWeight.w300, color: myGrey[200], fontSize: 18),
          ),
        ),
      ),
    );
  }
}
