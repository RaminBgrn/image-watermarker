import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnClick = Function(String value);

class RadioItem extends StatelessWidget {
  Widget icon;
  Color? color;
  String? svgUrl;
  String? svgPath;
  String? imageUrl;
  String? imagePath;
  EdgeInsets? margin;
  EdgeInsets? padding;
  BoxDecoration? decoration;
  RadioItem({
    required this.icon,
    this.color,
    this.margin,
    this.padding,
    this.decoration,
    super.key,
  });

  RadioItem.fromSvgAsset({
    super.key,
    required this.icon,
    this.color,
    // this.margin,
    // this.padding,
    // this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
