import 'package:flutter/material.dart';

class TColors {
  // App basic colors
  static const Color basicPprimaryColor = Color(0xff4b68ff);
  static const Color basicSecondaryColor = Color(0xffffe24b);
  static const Color basicAccentColor = Color(0xffb0c7ff);

  // Text colors
  static const Color textPrimaryColor = Color(0xff333333);
  static const Color textSecondaryColor = Color(0xff6c757d);
  static const Color textWhiteColor = Colors.white;

// background colors
  static const Color backgroundLightColor = Color(0xfff6f6f6);
  static const Color backgroundDarkColor = Color(0xff272727);
  static const Color backgroundPrimaryColor = Color(0xfff3f5ff);

// background container colors
  static const Color backgroundContainerLightColor = Color(0xfff6f6f6);
  Color backgroundContainerDarkColor =
      TColors.backgroundLightColor.withOpacity(0.1);

  // Button Color
  static const Color buttonPrimaryColor = Color(0xff4b68ff);
  static const Color buttonSecondaryColor = Color(0xff6c757d);
  static const Color buttonDisabledColor = Color(0xffc4c4c4);

  // Border Color
  static const Color borderPrimaryColor = Color(0xffd9d9d9);
  static const Color borderSecondaryColor = Color(0xffe6e6e6);

  // error and validation color

  static const Color errorColor = Color(0xffd32f2f);
  static const Color successColor = Color(0xff388e3c);
  static const Color warningColor = Color(0xfff57c00);
  static const Color infoColor = Color(0xff1976d2);

  // neutral shades
  // static const Color shadesBlackColor = Color(0xff232323);
  // static const Color shadesDarkerGreyColor = Color(0xfff4f4f4);
  // static const Color shadesDarkGreyColor = Color(0xff939393);
  // static const Color shadesGreyColor = Color(0xff1976d2);
  // static const Color shadesSoftGreyColor = Color(0xfff4f4f4);
  // static const Color shadesLightGreyColor = Color(0xfff9f9f9);
  // static const Color shadesWhiteColor = Color(0xffffffff);

  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
  static const Color transparent = Colors.transparent;

  // Gradient colors

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffac0c4),
    ],
  );
}
