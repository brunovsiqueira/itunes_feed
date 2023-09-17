import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/implementations/logger_service_impl.dart';
import '../services/interfaces/logger_service.dart';

final loggerServiceProvider = Provider<LoggerService>((ref) {
  return LoggerServiceImpl();
});
