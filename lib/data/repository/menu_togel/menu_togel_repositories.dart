// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/list_menu_response.dart';

abstract class MenuTogelRepositories {
  Future<Either<ExceptionMessage, ListMenuResponse?>> listMenuTogel();
}
