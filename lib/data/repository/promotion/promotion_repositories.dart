import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/list_promotion_response.dart';

abstract class PromotionRepositories {
  Future<Either<ExceptionMessage, ListPromotionResponse?>> listPromotion();
}
