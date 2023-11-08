import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/design.dart';

import 'package:image_water_marker/widgets/text_field_with_title.dart';

void showSettingDialog() {
  Get.dialog(
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: 800,
            height: 600,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: myGrey[600]!,
                ),
                borderRadius: BorderRadius.circular(14),
                color: myGrey[800]),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Settings',
                          style: GoogleFonts.karla(
                              fontWeight: FontWeight.bold,
                              color: myGrey[300],
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: SvgPicture.asset(
                              'svgs/close.svg',
                              colorFilter: ColorFilter.mode(
                                  myRed[800]!, BlendMode.srcIn),
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Files Configuration',
                                style: GoogleFonts.karla(
                                    fontSize: 22, color: myGrey[300]),
                              ),
                              TextFieldWithTitle(
                                controller: TextEditingController(),
                                title: "",
                                isReadOnly: true,
                                textFieldHint: 'your business logo',
                              ),
                              TextFieldWithTitle(
                                controller: TextEditingController(),
                                title: "",
                                textFieldHint: "water mark image file",
                                isReadOnly: true,
                              ),
                              TextFieldWithTitle(
                                controller: TextEditingController(),
                                title: "",
                                isReadOnly: true,
                                textFieldHint: 'brands folder file(s)',
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                      Colors.transparent,
                                      myGrey[400]!,
                                      myGrey[300]!,
                                      myGrey[400]!,
                                      Colors.transparent,
                                    ])),
                              ),
                              Text(
                                'Design',
                                style: GoogleFonts.karla(
                                    fontSize: 22, color: myGrey[300]),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Design()
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0)
                            ])),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            blurRadius: 8,
                                            color:
                                                myGrey[600]!.withOpacity(0.3))
                                      ]),
                                  padding: const EdgeInsets.all(8),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'images/dummy.jpg',
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          width: 1,
                                          color: myGreen[600]!,
                                        ),
                                        backgroundColor:
                                            myGreen[900]!.withOpacity(0.2)),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 6.0),
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.karla(
                                          fontSize: 18,
                                          color: myGreen[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: myGrey[400]!.withOpacity(0.1));
}
