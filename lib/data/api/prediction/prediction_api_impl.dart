// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/prediction/prediction_api.dart';
import 'package:trading_journal/models/exception_message.dart';
import 'package:trading_journal/utils/base_services.dart';
import 'package:trading_journal/utils/request_enum.dart';
import 'package:trading_journal/utils/url_enum.dart';

import '../../../utils/setting_services.dart';

class PredictionApiImpl implements PredictionApi {
  final Dio dio = SettingServices.getSettingDio(
    "",
  );

  @override
  Future<Either<ExceptionMessage, Response?>> prediksiBolaKecil() async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.prediksiBola.name,
      tokenAuth: null,
      formData: FormData.fromMap({
        'kategori': "kecil",
      }),
    );
  }

  @override
  Future<Either<ExceptionMessage, Response?>> prediksiBolaBesar() async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.prediksiBola.name,
      tokenAuth: null,
      formData: FormData.fromMap({
        'kategori': "besar",
      }),
    );
  }

  @override
  Future<Either<ExceptionMessage, Response?>> listTogel() async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.prediksiTogel.name,
      tokenAuth: null,
    );
  }

  @override
  Future<Either<ExceptionMessage, Response?>> prediksiBolaSukses() async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.prediksiBolaSukses.name,
      tokenAuth: null,
    );
  }
}
