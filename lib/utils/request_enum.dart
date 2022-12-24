// ignore_for_file: constant_identifier_names

enum RequestEnum { POST, GET }

extension RequestEnumExtension on RequestEnum {
  String get name {
    switch (this) {
      case RequestEnum.GET:
        return 'GET';
      case RequestEnum.POST:
        return 'POST';
      default:
        return "";
    }
  }
}
