import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';

void myDialog({required String title, required VoidCallback yes, required VoidCallback no}) {
  Get.dialog(
    Dialog(
      child: Container(
        width: 50,
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: myGrey[700], boxShadow: [
          BoxShadow(
            color: myGrey[900]!.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ]),
        child: Column(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.karla(
                  fontSize: 16,
                  color: myGrey[300],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myGreen[900]!.withOpacity(0.3),
                    side: BorderSide(
                      color: myGreen[300]!,
                      width: 1,
                    ),
                  ),
                  onPressed: yes,
                  child: Text(
                    "Yes",
                    style: GoogleFonts.karla(
                      fontSize: 14,
                      color: myGreen[300],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myRed[900]!.withOpacity(0.3),
                    side: BorderSide(
                      color: myRed[300]!,
                      width: 1,
                    ),
                  ),
                  onPressed: no,
                  child: Text(
                    "No",
                    style: GoogleFonts.karla(
                      fontSize: 14,
                      color: myRed[300],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
