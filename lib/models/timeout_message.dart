import 'package:trading_journal/models/exception_message.dart';

class TimeoutMessage extends ExceptionMessage {
  TimeoutMessage()
      : super(message: "Connection Timeout. Silahkan coba kembali.");
}
