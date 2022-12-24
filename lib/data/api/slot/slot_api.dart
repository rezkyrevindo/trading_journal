// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../models/exception_message.dart';

abstract class SlotApi {
  Future<Either<ExceptionMessage, Response?>> listSlot();
  Future<Either<ExceptionMessage, Response?>> listGame();
}
