import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/list_setting_response.dart';

abstract class SettingRepositories {
  Future<Either<ExceptionMessage, ListSettingResponse?>> listSetting();
}
