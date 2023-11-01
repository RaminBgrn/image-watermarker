import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_water_marker/customs/model/radio_data.dart';

enum RadioIconAndTextDirection { ltr, rtl }

enum IconType { svgAsset, svgUrl, imageAsset, imageUrl }

typedef OnRadioClick = Function(dynamic data);

class WidgetRadioGroup extends StatefulWidget {
  final List<RadioData> data;
  final IconType iconTye;
  final OnRadioClick onRadioClick;
  final Axis? direction;
  final double? iconWidth;
  final double? iconHeight;
  final Color? activeIconColor;
  final Color? deactivateIconColor;
  final List<BoxShadow>? activeShadow;
  final List<BoxShadow>? deactivateShadow;
  final Color? backgroundColor;
  final String? title;
  final TextStyle? titleStyle;
  final double? spaceBetweenTitleAndIcon;
  final TextDirection? radioIconAndTextDirection;
  final EdgeInsets? itemPadding;
  final EdgeInsets? itemMargin;

  const WidgetRadioGroup({
    required this.data,
    required this.iconTye,
    required this.onRadioClick,
    this.iconWidth,
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
  late bool isActive;

  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(widget.data.length, (index) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              widget.onRadioClick(widget.data[index].value);
              setState(() {
                isActive = !isActive;
              });
            },
            child:
                Row(textDirection: widget.radioIconAndTextDirection, children: [
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
                  boxShadow:
                      isActive ? widget.activeShadow : widget.deactivateShadow,
                ),
                child: box(widget.iconTye, widget.data[index]),
              )
            ]),
          ),
        );
      }),
    );
  }

  Widget box(IconType type, RadioData data) {
    switch (type) {
      case IconType.imageAsset:
        return iconImageAsset(data.iconPath);
      case IconType.imageUrl:
        return iconImageUrl(data.iconPath);
      case IconType.svgAsset:
        return iconSvgAsset(data.iconPath);
      default:
        return iconSvgUrl(data.iconPath);
    }
  }

  Widget iconImageAsset(String path) {
    return Image.asset(
      path,
      width: widget.iconWidth,
      height: widget.iconHeight,
      color: isActive ? widget.activeIconColor : widget.deactivateIconColor,
    );
  }

  Widget iconImageUrl(String path) {
    return Image.network(
      path,
      width: widget.iconWidth,
      height: widget.iconHeight,
      color: isActive ? widget.activeIconColor : widget.deactivateIconColor,
    );
  }

  Widget iconSvgAsset(String path) {
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

  Widget iconSvgUrl(String path) {
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
