import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

const ColorScheme colorSchemeLight = ColorScheme.light(
  primary: kPrimaryColor,
  secondary: kSecondaryColor,
  error: kDangerColor,
);

const ColorScheme colorSchemeDark = ColorScheme.dark(
  primary: kPrimaryColor,
  secondary: kSecondaryColor,
  error: kDangerColor,
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.never,
  border: OutlineInputBorder(
    borderSide: const BorderSide(),
    borderRadius: BorderRadius.circular(20.0),
  ),
  contentPadding: const EdgeInsets.all(10.0),
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 15.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
);

const AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  centerTitle: true,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
);

const TabBarTheme tabBarTheme = TabBarTheme(
  indicator: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Colors.white,
        width: 4.0,
      ),
    ),
  ),
);

const BottomNavigationBarThemeData bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,
);

const FloatingActionButtonThemeData floatingActionButtonTheme =
    FloatingActionButtonThemeData(
  backgroundColor: kPrimaryColor,
  foregroundColor: Colors.white,
);
