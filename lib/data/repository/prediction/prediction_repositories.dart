import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/list_prediction_bola_response.dart';
import '../../models/list_togel_response.dart';

abstract class PredictionRepositories {
  Future<Either<ExceptionMessage, ListTogelResponse?>> listTogel();
  Future<Either<ExceptionMessage, ListPredictionBolaResponse?>>
      prediksiBolaBesar();
  Future<Either<ExceptionMessage, ListPredictionBolaResponse?>>
      prediksiBolaKecil();
  Future<Either<ExceptionMessage, ListPredictionBolaResponse?>>
      prediksiBolaSukses();
}
