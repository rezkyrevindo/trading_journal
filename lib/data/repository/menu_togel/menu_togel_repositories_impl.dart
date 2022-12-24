// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/menu_togel/menu_togel_api_impl.dart';
import 'package:trading_journal/models/not_found_message.dart';
import 'package:trading_journal/models/server_error_message.dart';

import '../../../models/exception_message.dart';
import '../../models/list_menu_response.dart';
import 'menu_togel_repositories.dart';

class MenuTogelRepositoriesImpl implements MenuTogelRepositories {
  MenuTogelApiImpl api = MenuTogelApiImpl();

  @override
  Future<Either<ExceptionMessage, ListMenuResponse?>> listMenuTogel() async {
    ListMenuResponse? result;
    Response? response;
    final listContactResponse = await api.listMenuTogel();
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = ListMenuResponse.fromJson(responseData);
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
