import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';

class MySnackBar {
  static showMySnackBar(Color backgroundColor,
      {required String title, required String message}) {
    Get.snackbar('', '',
        titleText: Container(
          width: 100,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.karla(
                  fontSize: 18,
                  color: myGrey[400],
                ),
              ),
              Text(
                message,
                style: GoogleFonts.karla(
                  fontSize: 14,
                  color: myGrey[300],
                ),
              )
            ],
          ),
        ));
  }
}
