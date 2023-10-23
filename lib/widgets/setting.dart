import 'package:flutter/material.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/setting_dialog.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: () {
        showSettingDialog();
      },
      icon: Icon(
        Icons.settings,
        color: myGrey[400],
      ),
    );
  }
}
