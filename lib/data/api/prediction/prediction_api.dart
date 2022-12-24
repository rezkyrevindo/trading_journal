// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../models/exception_message.dart';

abstract class PredictionApi {
  Future<Either<ExceptionMessage, Response?>> prediksiBolaKecil();
  Future<Either<ExceptionMessage, Response?>> prediksiBolaBesar();
  Future<Either<ExceptionMessage, Response?>> listTogel();
  Future<Either<ExceptionMessage, Response?>> prediksiBolaSukses();
}
