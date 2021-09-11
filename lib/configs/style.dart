import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmp_flutter/configs/constants.dart';

final kRMPTheme = _buildMainTheme();

ThemeData _buildMainTheme() {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    // accentColor: kAlternativeColor,
    primaryColor: kBrandColor,
    splashColor: kBrandColor,
    buttonTheme: baseTheme.buttonTheme.copyWith(
      buttonColor: kBrandColor,
    ),
    iconTheme: baseTheme.iconTheme.copyWith(color: kLightColor),
    scaffoldBackgroundColor: kBgColor,
    cardColor: kLightColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kBrandColor, width: 1),
      ),
    ),
    textTheme: _buildTextTheme(baseTheme.textTheme),
    primaryTextTheme: _buildTextTheme(baseTheme.primaryTextTheme),
    // accentTextTheme: _buildTextTheme(baseTheme.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  const mst = GoogleFonts.montserrat;
  const rbt = GoogleFonts.roboto;

  return base.copyWith(
    headline2: mst(
      fontSize: kFontSizeHeadline2,
      fontWeight: FontWeight.bold,
      color: kBlackColor,
    ),
    headline3: mst(
      fontSize: kFontSizeHeadline3,
      fontWeight: FontWeight.bold,
      color: kBrandDarkerColor,
    ),
    headline4: mst(
      fontSize: kFontSizeHeadline4,
      fontWeight: FontWeight.bold,
      color: kBlackColor,
    ),
    bodyText1: rbt(
      fontSize: kFontSizeBody1,
      fontWeight: FontWeight.normal,
      color: kBlackColor,
    ),
    bodyText2: rbt(
      fontSize: kFontSizeBody2,
      fontWeight: FontWeight.normal,
      color: kBlackColor,
    ),
    subtitle1: rbt(
      fontSize: kFontSizeSubtitle1,
      fontWeight: FontWeight.normal,
      color: kSubtitleColor,
    ),
  );
}
