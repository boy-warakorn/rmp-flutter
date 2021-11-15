import 'package:flutter/material.dart';

const kBrandColor = Color(0xFF3A49F8);
const kBrandDarkerColor = Color(0xFF050D64);
const kBrandAlternativeDarkerColor = Color(0xFF202CBB);
const kStrokeColor = Color(0xFF1999F2);
const kBrandTitleColor = Color(0xFF212121);
const kBrandLighterColor = Color(0xFF8BCAF5);
const kDrawerColor = Color(0xFFDFE0EB); 

const kAlternativeColor = Color(0xFF7D7676);

const kSubtitleColor = Color(0xFF898181);

const kInputBorderColor = Color(0xFFE8E8E8);

const kErrorColor = Color(0xFFFB3143);
const kSuccessColor = Color(0xFF5DB075);
const kWarningColor = Color(0xFFFDA027);
const kBgColor = Color(0xFFF0F0F0);
const kLightColor = Colors.white;
const kBlackColor = Colors.black;

final Shader kGradientColor =
    LinearGradient(colors: <Color>[kBrandColor, kBrandAlternativeDarkerColor])
        .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
