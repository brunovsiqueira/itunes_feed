import 'package:logging/logging.dart';
import 'package:songs_app/src/errors/failures/base_failure.dart';

class UnknownFailure extends BaseFailure {
  const UnknownFailure({
    required super.exception,
    super.message = 'An unknown error has occurred. Please contact support.',
    super.level = Level.SEVERE,
    super.stackTrace,
  });
}
