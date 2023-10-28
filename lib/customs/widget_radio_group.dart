import 'package:flutter/material.dart';

abstract class WidgetRadioGroup extends StatelessWidget {
  final List<Widget> items;

  const WidgetRadioGroup({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    for (Widget item in items) {
      return item;
    }
    return const SizedBox();
  }
}

class RadioGroup extends WidgetRadioGroup {
  const RadioGroup.wrap({super.key, required super.items});
}
