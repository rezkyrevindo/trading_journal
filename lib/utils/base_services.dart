import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:trading_journal/models/exception_message.dart';
import 'package:trading_journal/models/server_error_message.dart';
import 'package:trading_journal/models/timeout_message.dart';
import '../utils/request_enum.dart';

// ignore: long-method
// ignore: long-parameter-list
// ignore: long-method
Future<Either<ExceptionMessage, Response?>> baseService(
  RequestEnum typeReq,
  Dio dio,
  String url, {
  required String? tokenAuth,
  bool isDisplayLog = false,
  Map<String, dynamic>? body,
  FormData? formData,
}) async {
  Response? result;
  Map<String, String> headers = {};
  if (tokenAuth != null) {
    headers = {"Authorization": tokenAuth};
  }

  final listLog = [];
  listLog.add("==============================================================");
  listLog.add("SERVICE YANG DI HIT");
  listLog.add(url);
  listLog.add("==============================================================");
  listLog.add("REQUEST");
  if (body is String) {
    listLog.add(body);
  }

  listLog.add("==============================================================");
  listLog.add("RESPONSE");
  try {
    Response response;
    if (typeReq == RequestEnum.POST) {
      dynamic request;
      if (body == null) {
        request = jsonEncode(body);
      }
      if (formData != null) {
        request = formData;
      }
      response = await dio.post(
        url,
        data: request,
        options: Options(
          headers: headers,
        ),
      );
    } else {
      final request = body;
      response = await dio.get(
        url,
        queryParameters: request,
        options: Options(
          headers: headers,
        ),
      );
    }

    listLog.add(response.data);
    result = response;
  } on DioError catch (e) {
    if (e.response != null) {
      listLog.add(e.response?.data);
      result = e.response;
    } else {
      listLog.add(e.message);
      result = null;
    }
    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return Left(TimeoutMessage());
    }
  } catch (e) {
    listLog.add(e);
    result = null;
    return Left(ServerErrorMessage());
  }
  listLog.add("==============================================================");
  if (isDisplayLog) {
    Logger().wtf(listLog);
  }

  return Right(result);
}
