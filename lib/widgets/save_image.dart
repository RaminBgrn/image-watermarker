import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_water_marker/utils/colors.dart';

class SaveImage extends StatelessWidget {
  const SaveImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset(
          'svgs/export.svg',
          colorFilter: ColorFilter.mode(myGreen[300]!, BlendMode.srcIn),
        ),
      ),
    );
  }
}
