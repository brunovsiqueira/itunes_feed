import 'package:logging/logging.dart';
import 'package:songs_app/src/errors/failures/base_failure.dart';

class ServerFailure extends BaseFailure {
  const ServerFailure({
    super.message = 'A server failure has occured.',
    super.exception,
    super.stackTrace = StackTrace.empty,
    super.level = Level.WARNING,
  });
}
