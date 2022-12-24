import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:validators/validators.dart';

class Validations {
  final int length;
  final int maxLength;
  final bool mandatory;
  final bool email;
  final bool date;
  final bool numeric;
  final bool ktp;
  final bool nik;
  final bool npwpNo;
  final bool npwpName;
  final bool npwpNameDedup;
  final String field;
  final bool afterDate;
  final bool belowDate;
  final bool noHp;
  final bool isAsuransi;
  final bool isCurrency;
  final bool isUangMukaKaroseri;
  final bool moreThanZero;
  final bool isCantMinus;
  final bool isBunga;
  int? maxYear;
  final bool isPrefixNoTelp;
  Validations({
    this.mandatory = false,
    this.length = 0,
    this.maxLength = 0,
    this.field = "",
    this.nik = false,
    this.email = false,
    this.date = false,
    this.maxYear,
    this.ktp = false,
    this.npwpNo = false,
    this.npwpName = false,
    this.npwpNameDedup = false,
    this.noHp = false,
    this.isPrefixNoTelp = false,
    this.numeric = false,
    this.afterDate = false,
    this.belowDate = false,
    this.isCantMinus = false,
    this.isAsuransi = false,
    this.isCurrency = false,
    this.isUangMukaKaroseri = false,
    this.moreThanZero = false,
    this.isBunga = false,
  });

  DateTime currentDate = DateTime.now();
  String? nonValidate(String? value) {
    return null;
  }

  // ignore: long-method
  String? validate(String? value) {
    final RegExp regexEmoji = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
    );
    if (value != null && value.isNotEmpty && value.startsWith(" ")) {
      return field != ""
          ? "$field Tidak boleh awalan spasi"
          : "${""}Tidak boleh awalan spasi";
    }

    if (value != null) {
      if (value.isNotEmpty && value.contains(regexEmoji)) {
        return field != ""
            ? "$field Tidak boleh menggunakan emoji"
            : "${""}Tidak boleh menggunakan emoji";
      }
    }

    if (mandatory && ((value == null) || (value.trim() == ""))) {
      return field != ""
          ? "$field Tidak boleh kosong."
          : "${""}Tidak boleh kosong.";
    }
    if (mandatory && isCantMinus && value!.startsWith("-")) {
      return field != ""
          ? "$field Tidak boleh Minus."
          : "${""}Tidak boleh Minus.";
    }

    if (mandatory && (value!.isEmpty || value == "" || value == " ")) {
      return field != "" ? "$field Tidak boleh kosong." : "Tidak boleh kosong.";
    }

    if (mandatory &&
        isBunga &&
        (value!.isEmpty ||
            value == "0" ||
            value == "" ||
            value == "0." ||
            value == "0.0" ||
            value == " ")) {
      return field != "" ? "$field Tidak boleh kosong." : "Tidak boleh kosong.";
    }

    if (mandatory &&
        moreThanZero &&
        (value!.isEmpty || value == "" || value == " " || value == "0")) {
      return field != ""
          ? "$field Nilai harus lebih dari 0."
          : "Nilai harus lebih dari 0.";
    }

    if (mandatory) {
      if (length >= 1 && (value!.length < length)) {
        return field != ""
            ? "$field Minimal $length karakter."
            : "${""}Minimal $length karakter.";
      }
    } else {
      if (value == null && mandatory) {
        return field != ""
            ? "$field Tidak boleh kosong."
            : "Tidak boleh kosong.";
      } else if (value == null && !mandatory) {
        return null;
      }
      if (value!.isNotEmpty) {
        if (length >= 1 && (value.length < length)) {
          return field != ""
              ? "$field Minimal $length karakter."
              : "${""}Minimal $length karakter.";
        }
      }
    }
    if (mandatory && nik && numeric) {
      final RegExp nikRegExp = RegExp('[0-9]{8,8}');
      if (!nikRegExp.hasMatch(value!)) {
        return 'Nik harus terdiri dari 8 digit';
      }
    }

    if (maxLength != 0 && (value!.length > maxLength)) {
      return field != ""
          ? "$field Maksimal $maxLength karakter."
          : "${""}Maksimal $maxLength karakter.";
    }
    if ((isCurrency && value == "0") || (isCurrency && value == null)) {
      return field != ""
          ? "$field Nilai harus lebih dari 0"
          : "${""}Nilai harus lebih dari 0";
    }

    if (email && !isEmail(value!) && value.isNotEmpty) {
      return field != ""
          ? "$field Harus berformat email."
          : "${""}Harus berformat email.";
    }

    if (numeric && !isNumeric(value!) && value.isNotEmpty) {
      return field != ""
          ? "$field Harus berformat angka."
          : "${""}Harus berformat angka.";
    }

    if (date && value == "yyyy-MM-dd") {
      return field != "" ? "$field Tidak boleh kosong." : "Tidak boleh kosong.";
    }

    final DateTime dateNow = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    );
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String dateMax;
    maxYear ??= dateNow.year;
    dateMax = dateFormat.format(DateTime(maxYear!, dateNow.month, dateNow.day));

    if (date && !isBefore(value, dateMax) && value!.isNotEmpty) {
      return field != ""
          ? "$field Format tanggal tidak valid"
          : "${""}Format tanggal tidak valid";
    }

    if (date && value!.isNotEmpty && !isValidDate(value)) {
      return field != ""
          ? "$field Format tanggal tidak valid"
          : "${""}Format tanggal tidak valid";
    }

    if (noHp && value!.isNotEmpty && !value.startsWith("0")) {
      return field != ""
          ? "$field Harus berawalkan 0."
          : "${""}Harus berawalkan 0.";
    }
    if (isPrefixNoTelp && value!.isNotEmpty && !value.startsWith("0")) {
      return field != ""
          ? "$field Harus berawalan 0"
          : "${""}Harus berawalan 0";
    }
    if (isPrefixNoTelp && value!.isNotEmpty && value.startsWith("08")) {
      return field != ""
          ? "$field Tidak boleh berawalan 08"
          : "${""}Tidak boleh berawalan 08";
    }
    if (afterDate && numeric && (currentDate.year - int.parse(value!) < 0)) {
      return field != ""
          ? "$field Tahun harus lebih kecil."
          : "${""}Tahun harus lebih kecil.";
    }
    if (belowDate && numeric && (int.parse(value!) < 1900)) {
      return field != "" ? "$field Minimal 1900." : "${""}Minimal 1900.";
    }

    return null;
  }

  bool isValidDate(String input) {
    try {
      final date = DateTime.parse(input);
      final day = daysInMonth(date.year, date.month);
      if (date.day <= day) {
        final originalFormatString = toOriginalFormatString(date);
        return input == originalFormatString;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$y-$m-$d";
  }
}
