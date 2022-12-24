import 'package:trading_journal/models/exception_message.dart';

class ServerErrorMessage extends ExceptionMessage {
  ServerErrorMessage()
      : super(
          message:
              "Terdapat kesalahan ketika mengakses server. Silahkan coba kembali.",
        );
}
