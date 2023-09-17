import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../network/implementations/api_impl.dart';
import '../network/interfaces/api.dart';
import '../services/implementations/connectivity_service_impl.dart';
import 'logger_service_provider.dart';

final apiProvider = Provider<API>((ref) {
  return APIImpl(
    headersBuilders: {},
    dio: Dio(),
    connectivityService: ConnectivityServiceImpl(
      ref.read(loggerServiceProvider),
      InternetConnection(),
    ),
  );
});
