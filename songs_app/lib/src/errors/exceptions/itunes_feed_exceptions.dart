// ignore_for_file: must_be_immutable

import 'package:songs_app/src/errors/exceptions/server_exceptions.dart';

class GetFeedEntriesException extends ServerException {
  GetFeedEntriesException({required super.dioException});
}
