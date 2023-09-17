// ignore_for_file: must_be_immutable

import 'package:songs_app/src/errors/exceptions/server_exceptions.dart';

class GetItunesFeedException extends ServerException {
  GetItunesFeedException({required super.dioException});
}
