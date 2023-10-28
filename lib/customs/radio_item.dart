import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef OnClick = Function(String value);

abstract class RadioButton extends StatelessWidget {
  final Widget icon;
  final List<BoxShadow>? shadow;
  final Color? backgroundColor;
  final String? title;
  final TextStyle? titleStyle;
  final double? spaceBetweenTitleAndIcon;
  final BorderRadius? borderRadius;
  final RadioIconAndTextDirection? radioIconAndTextDirection;
  final EdgeInsets? itemPadding;
  final EdgeInsets? itemMargin;

  const RadioButton({
    required this.icon,
    this.shadow,
    this.spaceBetweenTitleAndIcon,
    this.title,
    this.itemPadding,
    this.itemMargin,
    this.backgroundColor,
    this.titleStyle,
    this.radioIconAndTextDirection,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: itemPadding,
        margin: itemMargin,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: shadow,
          borderRadius: borderRadius,
        ),
        child: Row(
          textDirection:
              radioIconAndTextDirection == RadioIconAndTextDirection.rtl
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '',
              style: titleStyle,
            ),
            SizedBox(
              width: spaceBetweenTitleAndIcon,
            ),
            icon,
          ],
        ));
  }
}

class RadioItem extends RadioButton {
  RadioItem.svgFromAsset({
    super.key,
    required String svgPaht,
    required dynamic value,
    double? iconWidth,
    double? iconHeight,
    ColorFilter? iconColor,
    List<BoxShadow>? shadow,
    Color? backgroundColor,
    String? title,
    TextStyle? titleStyle,
    double? spaceBetweenTitleAndIcon,
    BorderRadius? borderRadius,
    RadioIconAndTextDirection? radioIconAndTextDirection,
    EdgeInsets? itemPadding,
    EdgeInsets? itemMargin,
  }) : super(
            icon: SvgPicture.asset(
              svgPaht,
              width: iconWidth,
              height: iconHeight,
              colorFilter: iconColor,
            ),
            backgroundColor: backgroundColor,
            itemPadding: itemPadding,
            itemMargin: itemMargin,
            borderRadius: borderRadius,
            radioIconAndTextDirection: radioIconAndTextDirection,
            spaceBetweenTitleAndIcon: spaceBetweenTitleAndIcon,
            shadow: shadow,
            titleStyle: titleStyle,
            title: title);

  RadioItem.svgFromNetwork({
    super.key,
    required String url,
    required dynamic value,
    double? iconWidth,
    double? iconHeight,
    ColorFilter? iconColor,
    List<BoxShadow>? shadow,
    Color? backgroundColor,
    String? title,
    TextStyle? titleStyle,
    double? spaceBetweenTitleAndIcon,
    BorderRadius? borderRadius,
    RadioIconAndTextDirection? radioIconAndTextDirection,
    EdgeInsets? itemPadding,
    EdgeInsets? itemMargin,
  }) : super(
            icon: SvgPicture.network(
              url,
              width: iconWidth,
              height: iconHeight,
              colorFilter: iconColor,
            ),
            backgroundColor: backgroundColor,
            itemPadding: itemPadding,
            itemMargin: itemMargin,
            borderRadius: borderRadius,
            radioIconAndTextDirection: radioIconAndTextDirection,
            spaceBetweenTitleAndIcon: spaceBetweenTitleAndIcon,
            shadow: shadow,
            titleStyle: titleStyle,
            title: title);

  RadioItem.imageIconFromNetwork({
    super.key,
    required String url,
    required dynamic value,
    double? iconWidth,
    double? iconHeight,
    Color? iconColor,
    List<BoxShadow>? shadow,
    Color? backgroundColor,
    String? title,
    TextStyle? titleStyle,
    double? spaceBetweenTitleAndIcon,
    BorderRadius? borderRadius,
    RadioIconAndTextDirection? radioIconAndTextDirection,
    EdgeInsets? itemPadding,
    EdgeInsets? itemMargin,
  }) : super(
            icon: Image.network(
              url,
              width: iconWidth,
              height: iconHeight,
              color: iconColor,
            ),
            backgroundColor: backgroundColor,
            itemPadding: itemPadding,
            itemMargin: itemMargin,
            borderRadius: borderRadius,
            radioIconAndTextDirection: radioIconAndTextDirection,
            spaceBetweenTitleAndIcon: spaceBetweenTitleAndIcon,
            shadow: shadow,
            titleStyle: titleStyle,
            title: title);

  RadioItem.imageIconFromAsset({
    super.key,
    required String path,
    required dynamic value,
    double? iconWidth,
    double? iconHeight,
    Color? iconColor,
    List<BoxShadow>? shadow,
    Color? backgroundColor,
    String? title,
    TextStyle? titleStyle,
    double? spaceBetweenTitleAndIcon,
    BorderRadius? borderRadius,
    RadioIconAndTextDirection? radioIconAndTextDirection,
    EdgeInsets? itemPadding,
    EdgeInsets? itemMargin,
  }) : super(
            icon: Image.asset(
              path,
              width: iconWidth,
              height: iconHeight,
              color: iconColor,
            ),
            backgroundColor: backgroundColor,
            itemPadding: itemPadding,
            itemMargin: itemMargin,
            borderRadius: borderRadius,
            radioIconAndTextDirection: radioIconAndTextDirection,
            spaceBetweenTitleAndIcon: spaceBetweenTitleAndIcon,
            shadow: shadow,
            titleStyle: titleStyle,
            title: title);
}

enum RadioIconAndTextDirection { ltr, rtl }
// abstract class Parent extends StatelessWidget {
//   Widget widget;

//   Parent(this.widget);

//   @override
//   Widget build(BuildContext context) {
//     return widget;
//   }
// }

// class Child extends Parent {
//   Child.fromSVG(...) : super(SvgPicture.asset(...));
//   Child.fromImage(...) : super(Image.asset(...));
// }