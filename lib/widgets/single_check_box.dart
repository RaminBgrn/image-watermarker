import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_water_marker/utils/colors.dart';

typedef SingleValue = Function(bool isChecked);

class SingleCheckBox extends StatefulWidget {
  final SingleValue onClick;
  final bool defaultValue;
  const SingleCheckBox({required this.onClick, required this.defaultValue, super.key});

  @override
  State<SingleCheckBox> createState() => _SingleCheckBoxState();
}

class _SingleCheckBoxState extends State<SingleCheckBox> {
  late bool _isChecked;

  Color buttonColor = myGreen[400]!.withOpacity(0.8);

  @override
  void initState() {
    _isChecked = widget.defaultValue;
    onClick(widget.defaultValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isChecked = !_isChecked;
            onClick(_isChecked);
            widget.onClick(_isChecked);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: myGrey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            'svgs/check.svg',
            colorFilter: ColorFilter.mode(buttonColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  void onClick(bool state) {
    if (state) {
      buttonColor = myGreen[400]!.withOpacity(0.8);
    } else {
      buttonColor = myGrey[500]!;
    }
  }
}
