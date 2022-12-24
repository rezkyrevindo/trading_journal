import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtils {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future setRunningText(String value) async {
    await storage.write(
      key: "running_text",
      value: value,
    );
  }

  static Future<String?> getRunningText() async {
    return storage.read(
      key: "running_text",
    );
  }

  static Future setLinkKlikPopUp(String value) async {
    await storage.write(
      key: "link_klik_pop_up",
      value: value,
    );
  }

  static Future<String?> getLinkKlikPopUp() async {
    return storage.read(
      key: "link_klik_pop_up",
    );
  }

  static Future setPopUp(String value) async {
    await storage.write(
      key: "popup",
      value: value,
    );
  }

  static Future<String?> getPopUp() async {
    return storage.read(
      key: "popup",
    );
  }

  static Future setRules(String value) async {
    await storage.write(
      key: "rules",
      value: value,
    );
  }

  static Future<String?> getRules() async {
    return storage.read(
      key: "rules",
    );
  }

  static Future setIdLiveChat(String value) async {
    await storage.write(
      key: "id_live_chat",
      value: value,
    );
  }

  static Future<String?> getIdLiveChat() async {
    return storage.read(
      key: "id_live_chat",
    );
  }

  static Future setNoHp(String value) async {
    await storage.write(
      key: "no_hp",
      value: value,
    );
  }

  static Future<String?> getNoHp() async {
    return storage.read(
      key: "no_hp",
    );
  }

  static Future setToken(String value) async {
    await storage.write(
      key: "token",
      value: value,
    );
  }

  static Future<String?> getToken() async {
    return storage.read(
      key: "token",
    );
  }

  static Future setIsAgreed(String value) async {
    await storage.write(
      key: "is_agreed",
      value: value,
    );
  }

  static Future<String?> getIsAgreed() async {
    return storage.read(
      key: "is_agreed",
    );
  }

  static Future setTimePopUp(String value) async {
    await storage.write(
      key: "time_popup",
      value: value,
    );
  }

  static Future<String?> getTimePopUp() async {
    return storage.read(
      key: "time_popup",
    );
  }

  static Future setIdMember(String value) async {
    await storage.write(
      key: "id_member",
      value: value,
    );
  }

  static Future<String?> getIdMember() async {
    return storage.read(
      key: "id_member",
    );
  }

  static Future setListContact(String value) async {
    await storage.write(
      key: "list_contact",
      value: value,
    );
  }

  static Future<String?> getListContact() async {
    return storage.read(
      key: "list_contact",
    );
  }
}
