class ExceptionMessage {
  String message;
  ExceptionMessage({
    required this.message,
  });

  @override
  String toString() => 'Glitch(message: $message)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ExceptionMessage && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
