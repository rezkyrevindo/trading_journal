import 'package:trading_journal/models/exception_message.dart';

class NotFoundMessage extends ExceptionMessage {
  NotFoundMessage()
      : super(
          message: "Data Tidak Ditemukan. Silahkan coba kembali.",
        );
}
