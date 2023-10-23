import 'package:animated_svg/animated_svg.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/image_edit_control_panel.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({super.key});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  late SvgController svgController;
  @override
  void initState() {
    svgController = AnimatedSvgController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandChild(
        indicatorIconSize: 40,
        direction: Axis.horizontal,
        expandIndicatorStyle: ExpandIndicatorStyle.icon,
        indicatorIcon: Icons.cake,
        indicatorHintTextStyle: const TextStyle(fontSize: 16),
        indicatorBuilder: (context, onTap, expanded) => Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myGrey[700]!,
              ),
              child: GestureDetector(
                  onTap: () {
                    svgController.isCompleted
                        ? svgController.reverse()
                        : svgController.forward();
                    onTap();
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: myGrey[600],
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 6,
                                          color:
                                              myOrange[300]!.withOpacity(0.4))
                                    ]),
                                child: AnimatedSvg(
                                  duration: const Duration(milliseconds: 50),
                                  onTap: onTap,
                                  controller: svgController,
                                  children: [
                                    SvgPicture.asset(
                                      'svgs/edit.svg',
                                      colorFilter: ColorFilter.mode(
                                          myOrange[100]!, BlendMode.srcIn),
                                    ),
                                    SvgPicture.asset(
                                      'svgs/back.svg',
                                      colorFilter: ColorFilter.mode(
                                          myOrange[100]!, BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 6,
                                          color: myRed[300]!.withOpacity(0.4))
                                    ],
                                    color: myGrey[600],
                                  ),
                                  child: SvgPicture.asset(
                                    'svgs/remove.svg',
                                    colorFilter: ColorFilter.mode(
                                        myRed[300]!, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'images/test.jpg',
                                fit: BoxFit.fill,
                              ),
                            )),
                      )
                    ],
                  )),
            ),
        child: const ImageEditControlPanel());
  }
}
