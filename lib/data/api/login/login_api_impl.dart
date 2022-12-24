// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/models/exception_message.dart';
import 'package:trading_journal/utils/base_services.dart';
import 'package:trading_journal/utils/request_enum.dart';
import 'package:trading_journal/utils/url_enum.dart';

import '../../../utils/setting_services.dart';
import 'login_api.dart';

class LoginApiImpl implements LoginApi {
  final Dio dio = SettingServices.getSettingDio(
    "",
  );

  @override
  Future<Either<ExceptionMessage, Response?>> login({
    required String noHp,
  }) async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.prosesLoginNew.name,
      tokenAuth: null,
      formData: FormData.fromMap({
        'no_hp': noHp,
      }),
    );
  }
}
