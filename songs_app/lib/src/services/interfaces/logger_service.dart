import 'package:logging/logging.dart';
import 'package:songs_app/src/errors/failures/base_failure.dart';

abstract interface class LoggerService {
  Future<void> initialize({
    required String clientToken,
    required String environment,
  });

  Future<void> log({
    required Level level,
    required String message,
    StackTrace? stackTrace,
    Exception? exception,
    Map<String, dynamic>? extraAttributes,
  });

  Future<void> logException({
    required dynamic exception,
    Level? level,
    Map<String, dynamic>? extraAttributes,
  });

  Future<void> logFailure({
    required BaseFailure failure,
    Level? level,
    Map<String, dynamic>? extraAttributes,
  });
}
