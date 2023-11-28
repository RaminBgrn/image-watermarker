import 'package:flutter/material.dart';

BoxFit convertStringToBoxFitEnum(String fit) {
  Map<String, BoxFit> box = {
    'BoxFit.fill': BoxFit.fill,
    'BoxFit.cover': BoxFit.cover,
    'BoxFit.contain': BoxFit.contain,
    'BoxFit.fitHeight': BoxFit.fitHeight,
    'BoxFit.fitWidth': BoxFit.fitWidth,
  };
  return box[fit]!;
}

Alignment convertAlignmentsToEnum(String align) {
  Map<String, Alignment> alignment = {
    "Alignment.topRight": Alignment.topRight,
    "Alignment.topLeft": Alignment.topLeft,
    "Alignment.topCenter": Alignment.topCenter,
    "Alignment.center": Alignment.center,
    "Alignment.centerRight": Alignment.centerRight,
    "Alignment.centerLeft": Alignment.centerLeft,
    "Alignment.bottomRight": Alignment.bottomRight,
    "Alignment.bottomCenter": Alignment.bottomCenter,
    "Alignment.bottomLeft": Alignment.bottomLeft,
  };
  return alignment[align]!;
}
