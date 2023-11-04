import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_water_marker/common/my_tool_tip.dart';
import 'package:image_water_marker/controller/edit_image_controller.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';
import 'package:image_water_marker/customs/widget_radio_group.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/my_color_picker.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({super.key});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  late SvgController svgController;
  late double height;
  late bool isExpand;
  final ValueNotifier<Color?> hoveredColor = ValueNotifier<Color?>(null);
  @override
  void initState() {
    svgController = AnimatedSvgController();
    height = 360;
    isExpand = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 300,
      height: height,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: myGrey[700]!,
      ),
      child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Column(
                    children: [
                      Row(
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
                                        color: myOrange[300]!.withOpacity(0.4))
                                  ]),
                              child: MyToolTip(
                                message: 'Edit Photo',
                                child: AnimatedSvg(
                                  duration: const Duration(milliseconds: 300),
                                  onTap: () {
                                    isExpand = !isExpand;
                                    setState(() {
                                      isExpand ? height = 450 : height = 360;
                                      svgController.isCompleted
                                          ? svgController.reverse()
                                          : svgController.forward();
                                    });
                                  },
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
                                child: MyToolTip(
                                  message: "Remove Photo",
                                  child: SvgPicture.asset(
                                    'svgs/remove.svg',
                                    colorFilter: ColorFilter.mode(
                                        myRed[300]!, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 300,
                        height: 100,
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WidgetRadioGroup(
                                  iconTye: IconType.svgAsset,
                                  activeIconColor: Colors.cyan,
                                  deactivateIconColor: myGrey[400],
                                  backgroundColor: myGrey[700],
                                  activeShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 3),
                                        color: myGreen[800]!,
                                        blurRadius: 7),
                                  ],
                                  toolTipDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: myGrey[800],
                                  ),
                                  verticalOffset: -40,
                                  direction: Axis.horizontal,
                                  itemMargin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  activeDefault: 1,
                                  data: [
                                    RadioData(
                                        iconPath: 'svgs/fill.svg',
                                        value: BoxFit.fill,
                                        toolTipText: 'Fill'),
                                    RadioData(
                                        iconPath: 'svgs/contain.svg',
                                        value: BoxFit.contain,
                                        toolTipText: "Contain"),
                                    RadioData(
                                        iconPath: 'svgs/cover.svg',
                                        value: BoxFit.cover,
                                        toolTipText: "Cover"),
                                    RadioData(
                                        iconPath: 'svgs/fill_width.svg',
                                        value: BoxFit.fitWidth,
                                        toolTipText: "Fill Width"),
                                    RadioData(
                                        iconPath: 'svgs/fill_height.svg',
                                        value: BoxFit.fitHeight,
                                        toolTipText: 'Fill Height'),
                                  ],
                                  onRadioClick: (value) {
                                    Get.find<EditImageController>()
                                        .changeImageFit(value);
                                  })
                            ]),
                      ),
                      MyColorPicker(
                        onColor: (value) {},
                        widget: Container(
                          color: myGrey[700],
                          child: SvgPicture.asset(
                            'svgs/color_picker.svg',
                            colorFilter: ColorFilter.mode(
                              myGrey[300]!,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<EditImageController>(builder: (clr) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0,
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
                          fit: clr.getBoxFit,
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          )),
    );
    // child: const ImageEditControlPanel());
  }
}
