import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilsMethods {
  static Future<void> urlLauncher(String url) async {
    Uri uri = Uri.parse("https://$url");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Get.dialog(Dialog(
        child: Container(
          width: 100,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Text('Could not load page'),
        ),
      ));
      return;
    }
  }
}
