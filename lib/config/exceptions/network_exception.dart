final class NetworkException implements Exception {
  final String message;
  final NetworkExceptionType exceptionType;
  const NetworkException(this.message, this.exceptionType);
  @override
  String toString() {
    return 'type: $exceptionType message: $message';
  }
}

enum NetworkExceptionType { serverMaintenance, noInternet, unKnown }
