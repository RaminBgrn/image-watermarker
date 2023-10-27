import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnClick = Function(String value);

class RadioItem extends StatefulWidget {
  final Widget icon;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  const RadioItem({
    required this.icon,
    this.color,
    this.margin,
    this.padding,
    this.decoration,
    super.key,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: Colors.amber,
      child: widget.icon,
    );
  }
}
