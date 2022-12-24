import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/login_response.dart';

abstract class LoginRepositories {
  Future<Either<ExceptionMessage, LoginResponse?>> login({
    required String noHp,
  });
}
