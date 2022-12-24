// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/promotion/promotion_api_impl.dart';
import 'package:trading_journal/data/repository/promotion/promotion_repositories.dart';
import 'package:trading_journal/models/not_found_message.dart';
import 'package:trading_journal/models/server_error_message.dart';

import '../../../models/exception_message.dart';
import '../../models/list_promotion_response.dart';

class PromotionRepositoriesImpl implements PromotionRepositories {
  PromotionApiImpl api = PromotionApiImpl();

  @override
  Future<Either<ExceptionMessage, ListPromotionResponse>>
      listPromotion() async {
    ListPromotionResponse result;
    Response? response;
    final listContactResponse = await api.listPromotion();
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = ListPromotionResponse.fromJson(responseData);
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
