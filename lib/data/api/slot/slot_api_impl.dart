// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/slot/slot_api.dart';
import 'package:trading_journal/models/exception_message.dart';
import 'package:trading_journal/utils/base_services.dart';
import 'package:trading_journal/utils/request_enum.dart';
import 'package:trading_journal/utils/url_enum.dart';

import '../../../utils/setting_services.dart';

class SlotApiImpl implements SlotApi {
  final Dio dio = SettingServices.getSettingDio(
    "",
  );

  @override
  Future<Either<ExceptionMessage, Response?>> listSlot() async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.listSlot.name,
      tokenAuth: null,
    );
  }

  @override
  Future<Either<ExceptionMessage, Response?>> listGame() async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.listGame.name,
      tokenAuth: null,
    );
  }
}
