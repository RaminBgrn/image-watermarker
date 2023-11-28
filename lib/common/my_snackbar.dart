import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MySnackBar {
  static showMySnackBar({
    required String title,
    required String message,
    required Color titleColor,
    required Color messageColor,
  }) {
    Get.snackbar('', '',
        maxWidth: 400,
        titleText: Text(
          title,
          style: GoogleFonts.karla(
            fontSize: 18,
            color: titleColor,
          ),
        ),
        messageText: Text(
          message,
          style: GoogleFonts.karla(
            fontSize: 14,
            color: messageColor,
          ),
        ));
  }
}
