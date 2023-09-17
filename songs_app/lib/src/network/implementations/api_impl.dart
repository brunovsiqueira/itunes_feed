import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:songs_app/src/network/interfaces/api.dart';

import '../../errors/exceptions/server_exceptions.dart';
import '../../services/interfaces/connectivity_service.dart';

class APIImpl implements API {
  final Dio dio;

  final ConnectivityService connectivityService;

  final Map<String, Future<String?> Function()> headersBuilders;

  APIImpl({
    required this.headersBuilders,
    required this.dio,
    required this.connectivityService,
  });

  Future<Map<String, dynamic>> getHeaders() async {
    Map<String, dynamic> headers = {};

    for (var entry in headersBuilders.entries) {
      var value = await entry.value();

      if (value != null) {
        headers[entry.key] = value;
      }
    }

    return headers;
  }

  Future<void> _checkNetworkConnection(String path) async {
    var result = await connectivityService.isConnected();

    ServerException serverException = ServerException(
      dioException: DioException(requestOptions: RequestOptions(path: path)),
      message: "Verifique sua conexão e tente novamente!",
      level: Level.INFO,
    );

    result.fold((l) {
      throw serverException;
    }, (isConnected) {
      if (!isConnected) {
        throw serverException;
      }
    });
  }

  @override
  Future<Response<dynamic>> httpPost(
      {required String url,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? overrideHeaders,
      Map<String, dynamic> additionalHeaders = const {},
      ResponseType? responseType,
      int? receiveTimeoutInMs,
      int? sendTimeoutInMs}) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    await _checkNetworkConnection(url);

    Options options = Options(
      headers: mergeMaps(headers, additionalHeaders),
    );
    if (receiveTimeoutInMs != null) {
      options.receiveTimeout = Duration(milliseconds: receiveTimeoutInMs);
    }
    if (sendTimeoutInMs != null) {
      options.sendTimeout = Duration(milliseconds: sendTimeoutInMs);
    }

    final response = await dio.post(
      url,
      data: data,
      options: options,
      queryParameters: queryParams,
    );

    return response;
  }

  @override
  Future<Response<dynamic>> httpDelete(
      {required String url,
      data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? overrideHeaders,
      Map<String, dynamic> additionalHeaders = const {},
      ResponseType? responseType,
      int? receiveTimeoutInMs,
      int? sendTimeoutInMs}) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    await _checkNetworkConnection(url);

    Options options = Options(
      headers: mergeMaps(headers, additionalHeaders),
    );
    if (receiveTimeoutInMs != null) {
      options.receiveTimeout = Duration(milliseconds: receiveTimeoutInMs);
    }
    if (sendTimeoutInMs != null) {
      options.sendTimeout = Duration(milliseconds: sendTimeoutInMs);
    }

    final response = await dio.delete(
      url,
      data: data,
      options: options,
      queryParameters: queryParams,
    );

    return response;
  }

  @override
  Future<Response<dynamic>> httpGet(
      {required String url,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? overrideHeaders,
      Map<String, dynamic> additionalHeaders = const {},
      ResponseType? responseType,
      int? receiveTimeoutInMs,
      int? sendTimeoutInMs}) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    await _checkNetworkConnection(url);

    Options options = Options(
      headers: mergeMaps(headers, additionalHeaders),
    );
    if (receiveTimeoutInMs != null) {
      options.receiveTimeout = Duration(milliseconds: receiveTimeoutInMs);
    }
    if (sendTimeoutInMs != null) {
      options.sendTimeout = Duration(milliseconds: sendTimeoutInMs);
    }

    final response = await dio.get(
      url,
      options: options,
      queryParameters: queryParams,
    );

    return response;
  }

  @override
  Future<Response<dynamic>> httpPatch(
      {required data,
      required String url,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? overrideHeaders,
      Map<String, dynamic> additionalHeaders = const {},
      ResponseType? responseType,
      int? receiveTimeoutInMs,
      int? sendTimeoutInMs}) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    await _checkNetworkConnection(url);

    Options options = Options(
      headers: mergeMaps(headers, additionalHeaders),
    );
    if (receiveTimeoutInMs != null) {
      options.receiveTimeout = Duration(milliseconds: receiveTimeoutInMs);
    }
    if (sendTimeoutInMs != null) {
      options.sendTimeout = Duration(milliseconds: sendTimeoutInMs);
    }

    final response = await dio.patch(
      url,
      data: data,
      options: options,
      queryParameters: queryParams,
    );

    return response;
  }

  @override
  Future<Response<dynamic>> httpPut(
      {required data,
      required String url,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? overrideHeaders,
      Map<String, dynamic> additionalHeaders = const {},
      ResponseType? responseType,
      int? receiveTimeoutInMs,
      int? sendTimeoutInMs}) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    await _checkNetworkConnection(url);

    Options options = Options(
      headers: mergeMaps(headers, additionalHeaders),
    );
    if (receiveTimeoutInMs != null) {
      options.receiveTimeout = Duration(milliseconds: receiveTimeoutInMs);
    }
    if (sendTimeoutInMs != null) {
      options.sendTimeout = Duration(milliseconds: sendTimeoutInMs);
    }

    final response = await dio.put(
      url,
      data: data,
      options: options,
      queryParameters: queryParams,
    );

    return response;
  }

  @override
  Future<Response<dynamic>> retry(
      {required RequestOptions requestOptions,
      CancelToken? cancelToken,
      ResponseType? responseType,
      int? receiveTimeoutInMs,
      int? sendTimeoutInMs}) {
    // TODO: implement retry
    throw UnimplementedError();
  }
}
