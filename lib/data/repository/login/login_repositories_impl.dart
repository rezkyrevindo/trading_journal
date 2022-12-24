// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/login/login_api_impl.dart';
import 'package:trading_journal/data/repository/login/login_repositories.dart';
import 'package:trading_journal/models/not_found_message.dart';
import 'package:trading_journal/models/server_error_message.dart';

import '../../../models/exception_message.dart';
import '../../models/login_response.dart';

class LoginRepositoriesImpl implements LoginRepositories {
  LoginApiImpl api = LoginApiImpl();

  @override
  Future<Either<ExceptionMessage, LoginResponse?>> login({
    required String noHp,
  }) async {
    LoginResponse? result;
    Response? response;
    final listContactResponse = await api.login(
      noHp: noHp,
    );
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = LoginResponse.fromJson(responseData);
      } else if (response?.statusCode == 400) {
        return Left(NotFoundMessage());
      } else {
        return Left(ServerErrorMessage());
      }
    } else {
      return Left(ServerErrorMessage());
    }
    return Right(result);
  }
}
