class CustomException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  CustomException({required this.message, this.stackTrace});

  @override
  String toString() {
    return '$runtimeType: $message\nStackTrace: ${stackTrace ?? "Unavailable"}';
  }
}

class NetworkException extends CustomException {
  NetworkException({
    String message = "في مشكلة عندك في النت",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class ServerException extends CustomException {
  ServerException({
    String message = "المشكلة من عندنا هنحلها في اسرع وقت",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class AuthException extends CustomException {
  AuthException({
    String message = "خطأ في تسجيل الدخول راجع بياناتك",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class ValidationException extends CustomException {
  ValidationException({required String message, StackTrace? stackTrace})
    : super(message: message, stackTrace: stackTrace);
}
