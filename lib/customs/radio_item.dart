// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// typedef OnClick = Function(String value);

// // abstract class RadioButton extends StatelessWidget {
// //   final Widget icon;
// //   final List<BoxShadow>? shadow;
// //   final Color? backgroundColor;
// //   final String? title;
// //   final TextStyle? titleStyle;
// //   final double? spaceBetweenTitleAndIcon;
// //   final BorderRadius? borderRadius;
// //   final RadioIconAndTextDirection? radioIconAndTextDirection;
// //   final EdgeInsets? itemPadding;
// //   final EdgeInsets? itemMargin;

// //   const RadioButton({
// //     required this.icon,
// //     this.shadow,
// //     this.spaceBetweenTitleAndIcon,
// //     this.title,
// //     this.itemPadding,
// //     this.itemMargin,
// //     this.backgroundColor,
// //     this.titleStyle,
// //     this.radioIconAndTextDirection,
// //     this.borderRadius,
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return _RadioItem(
// //       iconValue: "",
// //       value: () {},
// //     );
// //   }
// // }

// class RadioItem extends StatelessWidget {
//   final String iconData;
//   final dynamic value;
//   final IconTye iconTye;
//   final double? iconWidth;
//   final double? iconHeight;
//   final ColorFilter? iconColor;
//   final List<BoxShadow>? shadow;
//   final Color? backgroundColor;
//   final String? title;
//   final TextStyle? titleStyle;
//   final double? spaceBetweenTitleAndIcon;
//   final BorderRadius? borderRadius;
//   final RadioIconAndTextDirection? radioIconAndTextDirection;
//   final EdgeInsets? itemPadding;
//   final EdgeInsets? itemMargin;

//   const RadioItem({
//     super.key,
//     required this.iconData,
//     required this.value,
//     required this.iconTye,
//     this.iconWidth,
//     this.iconHeight,
//     this.iconColor,
//     this.shadow,
//     this.backgroundColor,
//     this.title,
//     this.titleStyle,
//     this.spaceBetweenTitleAndIcon,
//     this.borderRadius,
//     this.radioIconAndTextDirection,
//     this.itemPadding,
//     this.itemMargin,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//           padding: itemPadding,
//           margin: itemMargin,
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             boxShadow: shadow,
//             borderRadius: borderRadius,
//           ),
//           child: Row(
//             textDirection:
//                 radioIconAndTextDirection == RadioIconAndTextDirection.rtl
//                     ? TextDirection.rtl
//                     : TextDirection.ltr,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 title ?? '',
//                 style: titleStyle,
//               ),
//               SizedBox(
//                 width: spaceBetweenTitleAndIcon,
//               ),
//             ],
//           )),
//     );
//   }
// }


// // abstract class Parent extends StatelessWidget {
// //   Widget widget;

// //   Parent(this.widget);

// //   @override
// //   Widget build(BuildContext context) {
// //     return widget;
// //   }
// // }

// // class Child extends Parent {
// //   Child.fromSVG(...) : super(SvgPicture.asset(...));
// //   Child.fromImage(...) : super(Image.asset(...));
// // }