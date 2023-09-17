import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/datasources/implementations/itunes_feed_remote_datasource_impl.dart';
import 'package:songs_app/src/enums/itunes_rss_channel.dart';
import 'package:songs_app/src/providers/api_provider.dart';
import 'package:songs_app/src/providers/logger_service_provider.dart';
import 'package:songs_app/src/services/implementations/itunes_feed_service_impl.dart';

import '../models/feed_entry_model.dart';
import '../services/interfaces/itunes_feed_service.dart';

final itunesFeedServiceProvider = Provider<ItunesFeedService>((ref) {
  return ItunesFeedServiceImpl(
    loggerService: ref.read(loggerServiceProvider),
    itunesFeedRemoteDatsource: ItunesFeedRemoteDatsourceImpl(
      api: ref.read(apiProvider),
      baseUrl: 'https://itunes.apple.com', //TODO: use baseURL from .env files
    ),
  );
});

final itunesFeedEntryListProvider =
    FutureProvider.family<List<FeedEntryModel>, ItunesRssChannelEnum>(
        (ref, rssChannel) async {
  var result = await ref.read(itunesFeedServiceProvider).getFeedEntries(
        itunesRssChannel: rssChannel,
      );
  List<FeedEntryModel> entryList = [];
  result.fold((failure) {
    throw failure;
  }, (resultList) {
    entryList = resultList;
  });
  return entryList;
});
