import 'package:flutter/material.dart';
import 'package:maka_live/utils/styles/colors.dart';

class Constants {
  static final double PADDING = 16;
  static final double APPBAR_HEIGHT = AppBar().preferredSize.height;

  static final SHADOW_LIGHT = BoxShadow(
    color: KColors.TEXT_COLOR_LIGHT.withOpacity(.3),
    blurRadius: 4.0,
    spreadRadius: 0.0,
    offset: const Offset(0.0, 0.0),
  );
}
