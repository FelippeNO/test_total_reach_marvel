import 'package:flutter/material.dart';

class UIColors {
  static const Color darkPrimary = Color(0xFF003280);
  static const Color primary = Color(0xFF0057E0);
  static const Color lightPrimary = Color(0xFFB3DCFF);

  static const Color red = Color(0xFF9E1515);
  static const Color darkRed = Color(0xFF9E1515);
  static const Color lightRed = Color(0xFF9E1515);

  static const Color orange = Color(0xFFF8AE3F);
  static const Color darkOrange = Color(0xFF9F6106);
  static const Color lightOrange = Color(0xFFFFD569);

  static const Color green = Color(0xFF43BD99);
  static const Color darkGreen = Color(0xFF37997C);
  static const Color lightGreen = Color(0xFFB4E5D6);

  static const Color blue = Color(0xFF838CE0);
  static const Color darkBlue = Color(0xFF5F66A3);
  static const Color lightBlue = Color(0xFFCDD1F3);

  static const Color greyOne = Color(0xFF222223);
  static const Color greyTwo = Color(0xFF334666);
  static const Color greyThree = Color(0xFF66748C);
  static const Color greyFour = Color(0xFF99A3B3);
  static const Color greyFive = Color(0xFFCCCDD8);

  static const Color azure = Color(0xFF008DF2);
  static const Color trueBlue = Color(0xFF0057E0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color freshAir = Color(0xFFB3DCFF);

  static const Color activeBlue = Color(0xFF3D50DF);
}

class UIGradients {
  static const LinearGradient primaryGradient = LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [UIColors.azure, UIColors.primary]);

  static const LinearGradient secondaryGradient = LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [UIColors.white, UIColors.freshAir]);

  static const LinearGradient onBoardingGradient = LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [UIColors.white, UIColors.lightPrimary]);
}
