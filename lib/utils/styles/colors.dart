import 'package:flutter/material.dart';

class KColors {
  static const PRIMARY_LIGHT = Color(0xffCC2860);
  static const PRIMARY_DARK = Color(0xffE83D76);
  static const TEXT_COLOR_DARK = Color(0xff515C70);
  // static const TEXT_COLOR_MEDIUM = Color(0xff494949);
  static const TEXT_COLOR_LIGHT = Color(0xff0D1F2D);
  // static const TEXT_COLOR_LIGHT = Color(0xff9EA3B0);
  // static const TEXT_COLOR_LIGHT2 = Color(0xff999799);
  // static const TEXT_COLOR_ACCENT = Color(0xff7C7A7A);
  // static const BLUE = Color(0xff015CE6);
  static const RED = Color(0xffde3723);
}

final Map<int, Color> colorMapLight = {
  50: const Color(0xffCC2860).withOpacity(.05),
  100: const Color(0xffCC2860).withOpacity(.1),
  200: const Color(0xffCC2860).withOpacity(.2),
  300: const Color(0xffCC2860).withOpacity(.3),
  400: const Color(0xffCC2860).withOpacity(.4),
  500: const Color(0xffCC2860).withOpacity(.5),
  600: const Color(0xffCC2860).withOpacity(.6),
  700: const Color(0xffCC2860).withOpacity(.7),
  800: const Color(0xffCC2860).withOpacity(.8),
  900: const Color(0xffCC2860),
};
final Map<int, Color> colorMapDark = {
  50: const Color(0xffE83D76).withOpacity(.05),
  100: const Color(0xffE83D76).withOpacity(.1),
  200: const Color(0xffE83D76).withOpacity(.2),
  300: const Color(0xffE83D76).withOpacity(.3),
  400: const Color(0xffE83D76).withOpacity(.4),
  500: const Color(0xffE83D76).withOpacity(.5),
  600: const Color(0xffE83D76).withOpacity(.6),
  700: const Color(0xffE83D76).withOpacity(.7),
  800: const Color(0xffE83D76).withOpacity(.8),
  900: const Color(0xffE83D76),
};
