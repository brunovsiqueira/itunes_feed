import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:songs_app/src/errors/failures/base_failure.dart';
import 'package:songs_app/src/services/implementations/connectivity_service_impl.dart';
import 'package:songs_app/src/services/interfaces/logger_service.dart';

class MockLoggerService extends Mock implements LoggerService {}

class MockInternetConnection extends Mock implements InternetConnection {}

void main() {
  final mockLoggerService = MockLoggerService();
  final mockConnectionChecker = MockInternetConnection();
  final service =
      ConnectivityServiceImpl(mockLoggerService, mockConnectionChecker);

  setUpAll(() {
    registerFallbackValue(const BaseFailure(message: 'failure'));
  });

  setUp(() {
    when(() => mockLoggerService.logFailure(
          failure: any(named: 'failure'),
        )).thenAnswer((_) async {
      return;
    });
  });

  void setUpSuccessfulConnectionCheck() {
    when(() => mockConnectionChecker.hasInternetAccess)
        .thenAnswer((_) async => true);
  }

  void setUpFailedConnectionCheck() {
    when(() => mockConnectionChecker.hasInternetAccess)
        .thenAnswer((_) async => false);
  }

  test(
      'should call InternetConnectionChecker and return true on successful connection check',
      () async {
    // Arrange
    setUpSuccessfulConnectionCheck();

    // Act
    final result = await service.isConnected();

    // Assert
    expect(result, const Right(true));
  });

  test(
      'should call InternetConnectionChecker and return false on failed connection check',
      () async {
    // Arrange
    setUpFailedConnectionCheck();

    // Act
    final result = await service.isConnected();

    // Assert
    expect(result, const Right(false));
  });
}
