import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/comment_response.dart';
import '../../models/detail_event_bola_response.dart';
import '../../models/participant_event_bola_response.dart';

abstract class EventBolaRepositories {
  Future<Either<ExceptionMessage, ParticipantEventBolaResponse?>>
      participantEventbola({
    required String idEventBola,
    required String limit,
    required String offset,
    required String auth,
  });
  Future<Either<ExceptionMessage, DetailEventBolaResponse?>> detailEventBola({
    required String idMember,
    required String auth,
  });
  Future<Either<ExceptionMessage, CommentResponse?>> comment({
    required String idMember,
    required String idEventBola,
    required String comment,
    required String auth,
  });
}
