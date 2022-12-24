// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/models/not_found_message.dart';
import 'package:trading_journal/models/server_error_message.dart';

import '../../../models/exception_message.dart';
import '../../api/ads/ads_api_impl.dart';
import '../../models/list_menu_response.dart';
import 'ads_repositories.dart';

class AdsRepositoriesImpl implements AdsRepositories {
  AdsApiImpl api = AdsApiImpl();

  @override
  Future<Either<ExceptionMessage, ListMenuResponse?>> listAds() async {
    ListMenuResponse? result;
    Response? response;
    final listContactResponse = await api.listAds();
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
