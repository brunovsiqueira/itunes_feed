import 'package:logging/logging.dart';
import 'package:songs_app/src/errors/failures/server_failure.dart';

class GetFeedEntriesFailure extends ServerFailure {
  const GetFeedEntriesFailure({
    super.message = 'Error getting itunes feed entries. Try again later.',
    required super.exception,
    super.level = Level
        .SEVERE, //TODO: do not set severe, instead use level from exception when logging
    super.stackTrace,
  });
}
