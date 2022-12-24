// ignore_for_file: constant_identifier_names

enum TextEnum {
  HEADLINE6,
  HEADLINE5,
  HEADLINE4,
  HEADLINE3,
  HEADLINE2,
  HEADLINE1,
  SUBTITLE1,
  SUBTITLE2,
  LABEL,
  BODY1,
  BODY2,
  BUTTON1,
  BUTTON2,
  CAPTION,
}

extension DocumentEnumExtension on TextEnum {
  String get name {
    switch (this) {
      case TextEnum.HEADLINE6:
        return 'Headline 6';
      case TextEnum.HEADLINE5:
        return 'Headline 5';
      case TextEnum.HEADLINE4:
        return 'Headline 4';
      case TextEnum.HEADLINE3:
        return 'Headline 3';
      case TextEnum.HEADLINE2:
        return 'Headline 2';
      case TextEnum.HEADLINE1:
        return 'Headline 1';
      case TextEnum.SUBTITLE1:
        return 'Subtitle 1';
      case TextEnum.SUBTITLE2:
        return 'Subtitle 2';
      case TextEnum.BODY1:
        return 'Body 1';
      case TextEnum.BODY2:
        return 'Body 2';
      case TextEnum.BUTTON1:
        return 'Button 1';
      case TextEnum.BUTTON2:
        return 'Button 2';
      case TextEnum.LABEL:
        return 'Label';
      case TextEnum.CAPTION:
        return 'Caption';
      default:
        return "Caption";
    }
  }
}
