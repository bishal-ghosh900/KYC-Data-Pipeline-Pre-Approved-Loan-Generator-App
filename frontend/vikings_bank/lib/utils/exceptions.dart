class NetworkException implements Exception{
  final String errorMessage;

  NetworkException(this.errorMessage);
}

class BankUserDetailsException implements Exception {
  final String errorMessage;

  BankUserDetailsException(this.errorMessage);
}

class BankInvalidUserException implements Exception {
  final String errorMessage;

  BankInvalidUserException(this.errorMessage);
}