// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../models/exception_message.dart';

abstract class EventApiBola {
  Future<Either<ExceptionMessage, Response?>> comment({
    required String idMember,
    required String idEventBola,
    required String comment,
    required String auth,
  });
  Future<Either<ExceptionMessage, Response?>> participantEventbola({
    required String idEventBola,
    required String limit,
    required String offset,
    required String auth,
  });
  Future<Either<ExceptionMessage, Response?>> detailEventBola({
    required String idMember,
    required String auth,
  });
}
