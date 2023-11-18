import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/design.dart';
import 'package:image_water_marker/widgets/single_check_box.dart';
import 'package:image_water_marker/widgets/text_field_with_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        GetBuilder<SettingController>(builder: (clr) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Files Configuration',
                                style: GoogleFonts.karla(
                                    fontSize: 22, color: myGrey[300]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Show business logo  ',
                                        style: GoogleFonts.karla(
                                            fontSize: 16, color: myGrey[300]),
                                      ),
                                      SingleCheckBox(onClick: (value) {
                                        Get.find<SettingController>()
                                            .checkToShowLog = value;
                                      }),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Show brands logo  ',
                                        style: GoogleFonts.karla(
                                            fontSize: 16, color: myGrey[300]),
                                      ),
                                      SingleCheckBox(onClick: (value) {
                                        Get.find<SettingController>()
                                            .showOrHideBrand = value;
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFieldWithTitle(
                                controller:
                                    clr.getWaterMarkImageFilePathController,
                                textFieldHint: "water mark image file",
                                onClearTap: () {
                                  clr.clearWaterMarkImage();
                                },
                                isReadOnly: true,
                                clearButtonColor: clr.isWaterMarkSelect
                                    ? myRed[400]
                                    : myGrey[300],
                                onTap: () {
                                  clr.chooseWaterMark();
                                },
                              ),
                              TextFieldWithTitle(
                                hasEnableButton: true,
                                controller:
                                    clr.getBusinessLogoPathTextController,
                                isReadOnly: true,
                                textFieldHint: 'your business logo',
                                clearButtonColor: clr.hasBusinessLogo
                                    ? myRed[400]
                                    : myGrey[300],
                                onClearTap: clr.clearBusinessLogo,
                                onTap: () async {
                                  clr.chooseBusinessLogoFile();
                                },
                              ),
                              TextFieldWithTitle(
                                hasEnableButton: true,
                                controller: TextEditingController(),
                                isReadOnly: true,
                                textFieldHint: 'brands folder file(s)',
                                onTap: () {},
                              ),
                            ],
                          );
                        }),
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
                  child: Builder(builder: (context) {
                    return GetBuilder<SettingController>(builder: (clr) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Align(
                              alignment: Alignment.center,
                              child:
                                  GetBuilder<SettingController>(builder: (clr) {
                                return Container(
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          clr.getImageBoarderRadius),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            blurRadius: 8,
                                            color:
                                                myGrey[600]!.withOpacity(0.3))
                                      ]),
                                  child: GetBuilder<SettingController>(
                                      builder: (clr) {
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/dummy.jpg',
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: clr.isWaterMarkSelect
                                              ? Image.file(clr.getWaterMarkFile)
                                              : const SizedBox(),
                                        ),
                                        Positioned.fill(
                                          bottom: 18,
                                          top: 18,
                                          child: Align(
                                            alignment:
                                                clr.getBrandsLogoAlignment,
                                            child: clr.hasShowBrands
                                                ? Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                width: 1,
                                                                color: myPink[
                                                                    400]!),
                                                            top: BorderSide(
                                                              width: 1,
                                                              color:
                                                                  myPink[400]!,
                                                            ),
                                                            right: BorderSide(
                                                              width: clr
                                                                  .getRightBrandBoarderWidth,
                                                              color:
                                                                  myPink[400]!,
                                                            ),
                                                            left: BorderSide(
                                                                width: clr
                                                                    .getLeftBrandBoarderWidth,
                                                                color: myPink[
                                                                    400]!))),
                                                    child: Text(
                                                      'brands logo',
                                                      style: GoogleFonts.karla(
                                                          color: myGrey[700],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                        ),
                                        clr.hasShowLogo
                                            ? Positioned.fill(
                                                top: 18,
                                                bottom: 18,
                                                child: Align(
                                                  alignment: clr
                                                      .getBusinessLogoAlignment,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  width: 1,
                                                                  color: myPink[
                                                                      400]!),
                                                              top: BorderSide(
                                                                width: 1,
                                                                color: myPink[
                                                                    400]!,
                                                              ),
                                                              left: BorderSide(
                                                                width: clr
                                                                    .getLeftBusinessBoarderWidth,
                                                                color: myPink[
                                                                    400]!,
                                                              ),
                                                              right: BorderSide(
                                                                  width: clr
                                                                      .getRightBusinessBoarderWidth,
                                                                  color: myPink[
                                                                      400]!))),
                                                      child: clr.hasBusinessLogo
                                                          ? ClipRect(
                                                              child:
                                                                  BackdropFilter(
                                                                filter: ImageFilter
                                                                    .blur(
                                                                        sigmaX:
                                                                            4,
                                                                        sigmaY:
                                                                            4),
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          4),
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.1),
                                                                  child: Image
                                                                      .file(
                                                                    clr.getLogoImage,
                                                                    // width: 50,
                                                                    height: 25,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Text(
                                                              'logo',
                                                              style: GoogleFonts
                                                                  .karla(
                                                                fontSize: 14,
                                                                color:
                                                                    myGrey[700],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    );
                                  }),
                                );
                              })),
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
                      );
                    });
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
