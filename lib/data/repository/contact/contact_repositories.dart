// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:trading_journal/models/exception_message.dart';

import '../../models/contact_response.dart';

abstract class ContactRepositories {
  Future<Either<ExceptionMessage, ContactResponse?>> listContact();
}
