import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_water_marker/controller/water_mark_controller.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/grid_view_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaterMarkController>(builder: (clr) {
      return clr.getImageForWaterMark.isNotEmpty
          ? SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: MasonryGridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                itemCount: clr.getImageForWaterMark.length,
                padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
                addRepaintBoundaries: true,
                shrinkWrap: true,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return GridViewItem(
                    model: clr.getImageForWaterMark[index],
                  );
                },
              ),
            )
          : Center(
              child: Text(
                'Please insert image to water mark :)',
                style: GoogleFonts.karla(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: myGrey[500]!,
                ),
              ),
            );
    });
  }
}
