import 'package:flutter/material.dart';
import 'package:image_water_marker/customs/radio_item.dart';

class WidgetRadioGroup extends StatefulWidget {
  final List<RadioItem> items;

  const WidgetRadioGroup({required this.items, super.key});

  @override
  State<WidgetRadioGroup> createState() => _WidgetRadioGroupState();
}

class _WidgetRadioGroupState extends State<WidgetRadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceAround,
      children: widget.items.map((item) => item).toList(),
    );
  }
}
