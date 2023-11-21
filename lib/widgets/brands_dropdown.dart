import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/controller/setting_controller.dart';
import 'package:image_water_marker/models/brands_logo_model.dart';
import 'package:image_water_marker/utils/colors.dart';

class BrandsDropdown extends StatelessWidget {
  const BrandsDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (clr) {
      return DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'svgs/dropdown.svg',
                colorFilter: ColorFilter.mode(myGrey[300]!, BlendMode.srcIn),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: myGrey[300]!,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          items: clr.getBrandsLogoModel
              .map(
                (brand) => DropdownMenuItem<BrandsLogoModel>(
                  value: brand,
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        decoration: BoxDecoration(color: myGrey[300], borderRadius: BorderRadius.circular(4)),
                        child: SvgPicture.file(
                          File(
                            brand.imagePath!,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            brand.title!,
                            style: GoogleFonts.karla(
                              fontSize: 14,
                              color: myGrey[300],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {},
          iconStyleData: const IconStyleData(
            iconDisabledColor: Colors.transparent,
            iconEnabledColor: Colors.transparent,
          ),
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 200,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black26,
              ),
              color: myGrey[700],
            ),
            elevation: 2,
          ),
          dropdownStyleData: DropdownStyleData(
              maxHeight: 400,
              width: 300,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: myGrey[800],
              ),
              elevation: 8,
              offset: const Offset(-50, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          menuItemStyleData: const MenuItemStyleData(
            height: 60,
            padding: EdgeInsets.only(left: 8, right: 8),
          ),
        ),
      );
    });
  }
}
