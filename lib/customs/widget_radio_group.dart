///With this widget, you will be able to customize radio buttons.
///The icons can be either images or SVG, and you can even load them from the server by specifying the icon type, which is an enum value.
///Additionally, you can set your own custom text for each button and apply styling as per your preferences.
///This flexibility allows you to create highly customizable and feature-rich radio button controls in your application.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';

enum RadioIconAndTextDirection { ltr, rtl }

enum IconType { svgAsset, svgUrl, imageAsset, imageUrl }

typedef OnRadioClick = Function(dynamic data, int index);

class WidgetRadioGroup extends StatefulWidget {
  /// data which you want as radio button
  final List<RadioData> data;

  /// With this property, you specify the type of icon to be displayed, supporting both SVG and images
  final IconType iconTye;

  /// The return value of each item in this method is accessible.
  final OnRadioClick onRadioClick;

  /// To position radio buttons both vertically and horizontally
  final Axis? direction;

  /// The width of the icons.
  final double? iconWidth;

  /// The height of the icons.
  final double? iconHeight;

  /// The color of the icon when active.
  final Color? activeIconColor;

  /// The color of the icon when deactivate.
  final Color? deactivateIconColor;

  ///The shadow of the icon when active.
  final List<BoxShadow>? activeShadow;

  ///The shadow of the icon when deactivate.

  final List<BoxShadow>? deactivateShadow;

  ///The background color of the group of radio buttons.
  final Color? backgroundColor;

  ///The text of the radio button.
  final String? title;

  ///The style of the text in the radio button
  final TextStyle? titleStyle;

  ///The spacing between the text and the icon of the radio button."
  final double? spaceBetweenTitleAndIcon;

  ///The alignment of the icon and text in the radio button.
  final TextDirection? radioIconAndTextDirection;

  ///The inner spacing of the radio button group.
  final EdgeInsets? itemPadding;

  ///The outer margin of the radio button group.
  final EdgeInsets? itemMargin;

  /// The default button should be less than or equal to the number of data values length.
  final int? activeDefault;

  /// The positioning of the buttons.
  final WrapAlignment? alignment;

  /// Tool tip textStyle for desktop version
  final TextStyle? toolTipTextStyle;

  /// Tool tip decoration for style message box
  final BoxDecoration? toolTipDecoration;

  /// Tool tip vertical offset
  final double? verticalOffset;

  const WidgetRadioGroup({
    required this.data,
    required this.iconTye,
    required this.onRadioClick,
    this.verticalOffset,
    this.toolTipTextStyle,
    this.alignment,
    this.activeDefault,
    this.iconWidth,
    this.toolTipDecoration,
    this.iconHeight,
    this.activeIconColor,
    this.deactivateIconColor,
    this.activeShadow,
    this.deactivateShadow,
    this.backgroundColor,
    this.title,
    this.titleStyle,
    this.spaceBetweenTitleAndIcon,
    this.radioIconAndTextDirection,
    this.itemMargin,
    this.direction,
    this.itemPadding,
    super.key,
  });

  @override
  State<WidgetRadioGroup> createState() => _WidgetRadioGroupState();
}

class _WidgetRadioGroupState extends State<WidgetRadioGroup> {
  late List<bool> buttonState;
  late int previousActiveButton;
  @override
  void initState() {
    previousActiveButton = widget.activeDefault ?? -1;
    buttonState = List<bool>.generate(
      widget.data.length,
      (index) {
        return (previousActiveButton >= 0 && index == previousActiveButton)
            ? true
            : false;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Wrap(
        alignment: widget.alignment ?? WrapAlignment.start,
        direction: widget.direction ?? Axis.vertical,
        children: List.generate(widget.data.length, (index) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Tooltip(
              textStyle: widget.toolTipTextStyle,
              message: widget.data[index].toolTipText ?? '',
              decoration: widget.toolTipDecoration,
              verticalOffset: widget.verticalOffset,
              child: GestureDetector(
                onTap: () {
                  if (previousActiveButton == index) return;
                  setState(() {
                    buttonState[index] = true;
                    if (previousActiveButton >= 0) {
                      buttonState[previousActiveButton] = false;
                    }
                    previousActiveButton = index;
                    widget.onRadioClick(widget.data[index].value, index);
                  });
                },
                child: Row(
                    textDirection: widget.radioIconAndTextDirection,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title ?? '',
                        style: widget.titleStyle,
                      ),
                      Container(
                          width: widget.iconWidth,
                          height: widget.iconHeight,
                          padding: widget.itemPadding,
                          margin: widget.itemMargin,
                          decoration: BoxDecoration(
                            color: widget.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: buttonState[index]
                                ? widget.activeShadow
                                : widget.deactivateShadow,
                          ),
                          child: box(widget.iconTye, widget.data[index],
                              buttonState[index]))
                    ]),
              ),
            ),
          );
        }),
      );
    });
  }

  Widget box(IconType type, RadioData data, bool isActive) {
    switch (type) {
      case IconType.imageAsset:
        return iconImageAsset(data.iconPath, isActive);
      case IconType.imageUrl:
        return iconImageUrl(data.iconPath, isActive);
      case IconType.svgAsset:
        return iconSvgAsset(data.iconPath, isActive);
      default:
        return iconSvgUrl(data.iconPath, isActive);
    }
  }

  Widget iconImageAsset(String path, bool isActive) {
    return Image.asset(
      path,
      width: widget.iconWidth,
      height: widget.iconHeight,
      color: isActive ? widget.activeIconColor : widget.deactivateIconColor,
    );
  }

  Widget iconImageUrl(String path, bool isActive) {
    return Image.network(
      path,
      width: widget.iconWidth,
      height: widget.iconHeight,
      color: isActive ? widget.activeIconColor : widget.deactivateIconColor,
    );
  }

  Widget iconSvgAsset(String path, bool isActive) {
    return SvgPicture.asset(
      path,
      width: widget.iconWidth,
      height: widget.iconHeight,
      colorFilter: isActive
          ? ColorFilter.mode(
              widget.activeIconColor ?? Colors.transparent, BlendMode.srcIn)
          : ColorFilter.mode(widget.deactivateIconColor ?? Colors.transparent,
              BlendMode.srcIn),
    );
  }

  Widget iconSvgUrl(String path, bool isActive) {
    return SvgPicture.network(
      path,
      width: widget.iconWidth,
      height: widget.iconHeight,
      colorFilter: isActive
          ? ColorFilter.mode(
              widget.activeIconColor ?? Colors.transparent, BlendMode.srcIn)
          : ColorFilter.mode(widget.deactivateIconColor ?? Colors.transparent,
              BlendMode.srcIn),
    );
  }
}
