import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:songs_app/src/datasources/interfaces/itunes_feed_remote_datasource.dart';
import 'package:songs_app/src/models/itunes_entry_model.dart';

import '../../errors/exceptions/itunes_feed_exceptions.dart';
import '../../network/interfaces/api.dart';

class ItunesFeedRemoteDatsourceImpl implements ItunesFeedRemoteDatsource {
  final API _api;
  final String _baseUrl;

  ItunesFeedRemoteDatsourceImpl(
    this._api,
    this._baseUrl,
  );

  @override
  Future<List<ItunesEntryModel>> getItunesFeed({
    required itunesRssChannel,
    int? limit,
  }) async {
    final String url =
        '$_baseUrl/us/${itunesRssChannel.name}/topalbums/limit=${limit ?? 100}/json';
    try {
      Response response = await _api.httpGet(url: url);
      return (jsonDecode(response.data)['feed']['entry'] as List)
          .map((e) => ItunesEntryModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw GetItunesFeedException(dioException: e);
    }
  }
}
