enum PrediksiBolaPageEnum { hariini, success }

extension PrediksiBolaPageEnumExtension on PrediksiBolaPageEnum {
  String get name {
    switch (this) {
      case PrediksiBolaPageEnum.hariini:
        return 'hariini';

      case PrediksiBolaPageEnum.success:
        return 'success';
      default:
        return "";
    }
  }
}
