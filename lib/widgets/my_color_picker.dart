import 'package:basics/int_basics.dart';
import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';

const _decoration =
    BoxDecoration(color: Colors.white24, shape: BoxShape.circle);

/// an eyeDropper standalone button
/// should be used with a context [EyeDrop] available
class MyColorPicker extends StatelessWidget {
  /// customisable icon ( default : [Icons.colorize] )
  final IconData icon;

  /// icon color, default : [Colors.blueGrey]
  final Color iconColor;

  /// color selection callback
  final ValueChanged<Color> onColor;

  /// hover, and the color changed callback
  final ValueChanged<Color>? onColorChanged;

  // picker icon
  final Widget widget;

  const MyColorPicker({
    required this.onColor,
    required this.widget,
    this.onColorChanged,
    this.icon = Icons.colorize,
    this.iconColor = Colors.black54,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: _decoration,
        child: GestureDetector(
          child: widget,
          onTap:
              // cf. https://github.com/flutter/flutter/issues/22308
              () => Future.delayed(
            50.milliseconds,
            () => _onEyeDropperRequest(context),
          ),
        ),
      );

  void _onEyeDropperRequest(BuildContext context) {
    try {
      EyeDrop.of(context).capture(context, onColor, onColorChanged);
    } catch (err) {
      throw Exception('EyeDrop capture error : $err');
    }
  }
}
