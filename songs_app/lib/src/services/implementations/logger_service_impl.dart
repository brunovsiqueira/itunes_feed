import 'package:logging/logging.dart';
import 'package:songs_app/src/errors/failures/base_failure.dart';

import '../interfaces/logger_service.dart';

class LoggerServiceImpl implements LoggerService {
  @override
  Future<void> initialize({
    required String clientToken,
    required String environment,
  }) async {
    // TODO: implement initialize
  }

  @override
  Future<void> log({
    required Level level,
    required String message,
    StackTrace? stackTrace,
    Exception? exception,
    Map<String, dynamic>? extraAttributes,
  }) async {
    // TODO: implement log
  }
  @override
  Future<void> logException({
    required dynamic exception,
    String? message,
    Level? level,
    StackTrace? stackTrace,
    Map<String, dynamic>? extraAttributes,
  }) async {
    // TODO: implement logException
  }

  @override
  Future<void> logFailure({
    required BaseFailure failure,
    String? message,
    Level? level,
    StackTrace? stackTrace,
    Map<String, dynamic>? extraAttributes,
  }) async {
    // TODO: implement logFailure
  }
}
