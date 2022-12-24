import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trading_journal/utils/text_enum.dart';

import '../utils/colors.dart';

class TextCustom extends StatelessWidget {
  final String? text;
  final TextEnum type;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int maxLines;

  const TextCustom({
    required this.text,
    required this.type,
    this.textAlign,
    this.maxLines = 10,
    this.color,
    this.fontSize,
    super.key,
  });

  // ignore: long-method
  TextStyle? styles(dynamic value) {
    switch (value) {
      case TextEnum.HEADLINE1:
        return GoogleFonts.poppins().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 24,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.HEADLINE2:
        return GoogleFonts.poppins().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 22,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.HEADLINE3:
        return GoogleFonts.poppins().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 20,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.HEADLINE4:
        return GoogleFonts.poppins().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 18,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.HEADLINE5:
        return GoogleFonts.poppins().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.HEADLINE6:
        return GoogleFonts.poppins().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 14,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.SUBTITLE1:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.SUBTITLE2:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 14,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.BODY1:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 16,
        );
      case TextEnum.BODY2:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 14,
        );
      case TextEnum.BUTTON1:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.bold,
        );
      case TextEnum.BUTTON2:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 14,
          fontWeight: FontWeight.w600,
        );
      case TextEnum.LABEL:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.bold,
        );
      case TextEnum.CAPTION:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 12,
        );
      default:
        return GoogleFonts.nunitoSans().copyWith(
          color: ColorsCustom.secondaryBlack,
          fontSize: fontSize ?? 12,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: styles(type)!.copyWith(
        color: color ?? ColorsCustom.secondaryBlack,
      ),
      textScaleFactor: 1.0,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.visible,
    );
  }
}
