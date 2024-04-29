class NotFoundException implements Exception {
  final String message;
  final _prefix;

  NotFoundException(this.message, this._prefix);

  String toString() {
    return "$message";
  }
}

class FetchDataException extends NotFoundException {
  FetchDataException([String? message])
      : super(message!, "Error During Communication: ");
}

class BadRequestException extends NotFoundException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NotFoundException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}
