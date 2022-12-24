import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsCustom {
  static Color mainColor = Colors.blueAccent;
  static Color secondaryColor = Colors.lightBlue[100] ?? Colors.white;
  static Color thirdColor = Colors.lightBlue[200] ?? Colors.white;

  static MaterialColor secondaryBlack = const MaterialColor(
    0xFF12162c,
    <int, Color>{
      50: Color(0xFFE0E0E0),
      100: Color(0xFFf6f6f6),
      150: Color(0xCCC7C8CD),
      200: Color(0xFFc7c8cd),
      300: Color(0xFF92949D),
      400: Color(0xFF4f5262),
      500: Color(0xFF12162c),
    },
  );

  static Color greenBackGround = const Color(0xFFEBF8F2);
  static Color darkBlueColor = const Color(0xFF12162C);
  static Color warningColor = const Color(0xFFF74F2C);
  static Color warningYellowColor = const Color(0xFFFFCC00);
  static Color greyColor = const Color(0xFF4F5262);
  static Color greyMudaColor = const Color(0xFFC7C8CD);
  static Color greyWhiteColor = const Color(0xFFF6F9FE);
  static Color greyDarkColor = const Color(0xFF92949D);
  static Color linkColor = const Color(0xFF0A66C2);

  static Color greenColor = const Color(0xFFEFFFF8);
  static Color greyBackgroundColor = const Color(0xFFF6F6F6);
  static Color darkGreenColor = const Color(0xFF28C27D);
  static Color lightGreenColor = const Color(0xFFD5F0B9);

  TextStyle poppinsTextFont = GoogleFonts.poppins()
      .copyWith(color: Colors.black, fontWeight: FontWeight.w400);

  static TextStyle nunitoTextFont = GoogleFonts.nunitoSans()
      .copyWith(color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle whiteTextFont = GoogleFonts.nunitoSans()
      .copyWith(color: Colors.white, fontWeight: FontWeight.w400);
  static TextStyle greyTextFont = GoogleFonts.nunitoSans()
      .copyWith(color: const Color(0xFF92949D), fontWeight: FontWeight.w400);

  static TextStyle title =
      nunitoTextFont.copyWith(fontSize: 16, color: const Color(0xFF92949D));
  static TextStyle value =
      nunitoTextFont.copyWith(fontSize: 16, color: const Color(0xFF12162C));
}
