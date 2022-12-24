// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/models/exception_message.dart';
import 'package:trading_journal/utils/base_services.dart';
import 'package:trading_journal/utils/request_enum.dart';
import 'package:trading_journal/utils/url_enum.dart';

import '../../../utils/setting_services.dart';
import 'event_bola_api.dart';

class EventBolaApiImpl implements EventApiBola {
  final Dio dio = SettingServices.getSettingDio(
    "",
  );

  @override
  Future<Either<ExceptionMessage, Response?>> comment({
    required String idMember,
    required String idEventBola,
    required String comment,
    required String auth,
  }) async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.commentEventBola.name,
      tokenAuth: auth,
      formData: FormData.fromMap({
        'id_member': idMember,
        'id_event_bola': idEventBola,
        'comment': comment,
      }),
    );
  }

  @override
  Future<Either<ExceptionMessage, Response?>> participantEventbola({
    required String idEventBola,
    required String limit,
    required String offset,
    required String auth,
  }) async {
    return baseService(
      RequestEnum.POST,
      dio,
      UrlEnum.participantEventbola.name,
      tokenAuth: auth,
      formData: FormData.fromMap({
        'id_event_bola': idEventBola,
        'limit': limit,
        'offset': offset,
      }),
    );
  }

  @override
  Future<Either<ExceptionMessage, Response?>> detailEventBola({
    required String idMember,
    required String auth,
  }) async {
    return baseService(
      RequestEnum.GET,
      dio,
      '${UrlEnum.detailEventBola.name}/$idMember',
      tokenAuth: auth,
    );
  }
}
