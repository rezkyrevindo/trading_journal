// ignore_for_file: always_use_package_imports

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import 'box_list.dart';

class StorageUtils {
  Future<List<int>> getEncryptionKey() async {
    const secureStorage = FlutterSecureStorage();
    String? encryptionKey = await secureStorage.read(key: 'key');
    if (encryptionKey == null) {
      final key = Hive.generateSecureKey(); //hive lib
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    encryptionKey = await secureStorage.read(key: 'key');
    final key = base64Decode(encryptionKey!);
    return key;
  }

  Future<Box> openBox(BoxListEnum nameBox) async {
    final encryptionKey = await getEncryptionKey();
    final Box box = await Hive.openBox(
      nameBox.name,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
    return box;
  }
}
