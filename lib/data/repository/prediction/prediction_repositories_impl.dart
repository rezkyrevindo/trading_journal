// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/prediction/prediction_api_impl.dart';
import 'package:trading_journal/data/repository/prediction/prediction_repositories.dart';
import 'package:trading_journal/models/not_found_message.dart';
import 'package:trading_journal/models/server_error_message.dart';

import '../../../models/exception_message.dart';
import '../../models/list_prediction_bola_response.dart';
import '../../models/list_togel_response.dart';

class PredictionRepositoriesImpl implements PredictionRepositories {
  PredictionApiImpl api = PredictionApiImpl();

  @override
  Future<Either<ExceptionMessage, ListTogelResponse?>> listTogel() async {
    ListTogelResponse? result;
    Response? response;
    final listContactResponse = await api.listTogel();
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = ListTogelResponse.fromJson(responseData);
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

  @override
  Future<Either<ExceptionMessage, ListPredictionBolaResponse?>>
      prediksiBolaBesar() async {
    ListPredictionBolaResponse? result;
    Response? response;
    final listContactResponse = await api.prediksiBolaBesar();
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = ListPredictionBolaResponse.fromJson(responseData);
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

  @override
  Future<Either<ExceptionMessage, ListPredictionBolaResponse?>>
      prediksiBolaKecil() async {
    ListPredictionBolaResponse? result;
    Response? response;
    final listContactResponse = await api.prediksiBolaKecil();
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = ListPredictionBolaResponse.fromJson(responseData);
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

  @override
  Future<Either<ExceptionMessage, ListPredictionBolaResponse?>>
      prediksiBolaSukses() async {
    ListPredictionBolaResponse? result;
    Response? response;
    final listContactResponse = await api.prediksiBolaSukses();
    listContactResponse.fold((l) {
      return l;
    }, (r) {
      response = r;
    });
    if (response != null) {
      if (response?.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response?.data as Map<String, dynamic>;
        result = ListPredictionBolaResponse.fromJson(responseData);
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
