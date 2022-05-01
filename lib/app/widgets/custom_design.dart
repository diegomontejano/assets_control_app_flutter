import 'package:flutter/material.dart';

class CustomDesign {
  // colors
  static const Color primaryColor1 = Color(0xff00D7B9);
  static const Color primaryColor2 = Color(0xffC1F3F2);
  static const Color secondaryColor1 = Color(0xffFFFFFF);
  static const Color secondaryColor2 = Color(0xFFEFEFEF);
  static const Color secondaryColor3 = Color(0xffD3D3D3);
  static const Color secondaryColor4 = Color(0xffAEAEAE);
  static const Color secondaryColor5 = Color(0xff323232);
  static const Color errorColor = Color(0xffF22B46);

  // theme
  static final theme = ThemeData(
    fontFamily: "Montserrat",
    iconTheme: const IconThemeData(
      color: CustomDesign.primaryColor1,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomDesign.primaryColor1,
      onPrimary: CustomDesign.secondaryColor5,
      secondary: CustomDesign.secondaryColor4,
      onSecondary: CustomDesign.secondaryColor5,
      error: CustomDesign.errorColor,
      onError: CustomDesign.secondaryColor1,
      background: CustomDesign.primaryColor1,
      onBackground: CustomDesign.secondaryColor5,
      surface: CustomDesign.primaryColor1,
      onSurface: CustomDesign.primaryColor1,
      outline: CustomDesign.primaryColor1,
    ),
  );
}
