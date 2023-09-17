import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:songs_app/src/datasources/interfaces/itunes_feed_remote_datasource.dart';
import 'package:songs_app/src/models/itunes_entry_model.dart';

import '../../enums/itunes_rss_channel.dart';
import '../../errors/exceptions/itunes_feed_exceptions.dart';
import '../../network/interfaces/api.dart';

class ItunesFeedRemoteDatsourceImpl implements ItunesFeedRemoteDatsource {
  final API api;
  final String baseUrl;

  ItunesFeedRemoteDatsourceImpl({
    required this.api,
    required this.baseUrl,
  });

  @override
  Future<List<ItunesEntryModel>> getFeedEntries({
    required ItunesRssChannelEnum itunesRssChannel,
    int? limit,
  }) async {
    final String url =
        '$baseUrl/us/rss/${itunesRssChannel.name}/limit=${limit ?? 100}/json';
    try {
      Response response = await api.httpGet(url: url);
      return (jsonDecode(response.data)['feed']['entry'] as List)
          .map((e) => ItunesEntryModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw GetFeedEntriesException(dioException: e);
    }
  }
}
