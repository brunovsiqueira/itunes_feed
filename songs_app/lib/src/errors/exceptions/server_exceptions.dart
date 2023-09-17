// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

class ServerException extends Equatable implements Exception {
  final DioException dioException;
  String? message;
  Level? level;

  ServerException({
    required this.dioException,
    this.message,
    this.level,
  }) {
    if (dioException
        case DioException(response: Response(statusCode: int statusCode))
        when statusCode >= 500 && statusCode < 600) {
      level = Level.SEVERE;
    } else {
      level = Level.WARNING;
    }
  }

  @override
  List<Object?> get props => [message, level, dioException];
}
