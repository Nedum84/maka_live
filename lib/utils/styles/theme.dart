import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maka_live/utils/styles/colors.dart';

class ThemeController extends GetxController {
  static ThemeController to = Get.find();
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    update();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: KColors.PRIMARY_LIGHT,
    primaryColorLight: Colors.white,
    // dividerColor: Colors.grey,
    dividerTheme: const DividerThemeData(
      color: Color(0xffF6F6F6),
      thickness: 6,
    ),
    colorScheme: const ColorScheme.light(brightness: Brightness.light),
    iconTheme: const IconThemeData(
      color: Colors.grey,
    ),
    primarySwatch: MaterialColor(0xffCC2860, colorMapLight),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      headline6: const TextStyle(
        fontSize: 16,
      ),
      headline5: const TextStyle(
        color: Color(0xff0D1F2D),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      iconTheme: IconThemeData(
        color: KColors.TEXT_COLOR_LIGHT,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: KColors.TEXT_COLOR_LIGHT,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      shadowColor: Color(0xffF6F6F6),
      elevation: 1,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: KColors.PRIMARY_DARK,
    colorScheme: const ColorScheme.dark(brightness: Brightness.light),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    primarySwatch: MaterialColor(0xffE83D76, colorMapDark),
    textTheme: GoogleFonts.latoTextTheme().copyWith(),
    appBarTheme: const AppBarTheme(color: KColors.TEXT_COLOR_DARK),
  );
}

TextTheme kTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}
