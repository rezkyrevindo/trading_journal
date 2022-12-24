import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/list_game_response.dart';
import '../../models/list_slot_response.dart';

abstract class SlotRepositories {
  Future<Either<ExceptionMessage, ListSlotResponse?>> listSlot();
  Future<Either<ExceptionMessage, ListGameResponse?>> listGame();
}
