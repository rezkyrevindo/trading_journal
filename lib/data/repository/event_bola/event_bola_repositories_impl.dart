// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trading_journal/data/api/event_bola/event_bola_api_impl.dart';
import 'package:trading_journal/data/repository/event_bola/event_bola_repositories.dart';
import 'package:trading_journal/models/not_found_message.dart';
import 'package:trading_journal/models/server_error_message.dart';

import '../../../models/exception_message.dart';
import '../../models/comment_response.dart';
import '../../models/detail_event_bola_response.dart';
import '../../models/participant_event_bola_response.dart';

class EventBolaRepositoriesImpl implements EventBolaRepositories {
  EventBolaApiImpl api = EventBolaApiImpl();

  @override
  Future<Either<ExceptionMessage, ParticipantEventBolaResponse?>>
      participantEventbola({
    required String idEventBola,
    required String limit,
    required String offset,
    required String auth,
  }) async {
    ParticipantEventBolaResponse? result;
    Response? response;
    final listContactResponse = await api.participantEventbola(
      idEventBola: idEventBola,
      limit: limit,
      offset: offset,
      auth: auth,
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
        result = ParticipantEventBolaResponse.fromJson(responseData);
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
  Future<Either<ExceptionMessage, DetailEventBolaResponse?>> detailEventBola({
    required String idMember,
    required String auth,
  }) async {
    DetailEventBolaResponse? result;
    Response? response;
    final listContactResponse = await api.detailEventBola(
      idMember: idMember,
      auth: auth,
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
        result = DetailEventBolaResponse.fromJson(responseData);
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
  Future<Either<ExceptionMessage, CommentResponse?>> comment({
    required String idMember,
    required String idEventBola,
    required String comment,
    required String auth,
  }) async {
    CommentResponse? result;
    Response? response;
    final listContactResponse = await api.comment(
      idMember: idMember,
      idEventBola: idEventBola,
      comment: comment,
      auth: auth,
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
        result = CommentResponse.fromJson(responseData);
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
