import 'package:songs_app/src/models/feed_entry_model.dart';

import '../../enums/itunes_rss_channel.dart';

abstract interface class ItunesFeedRemoteDatsource {
  Future<List<FeedEntryModel>> getFeedEntries({
    required ItunesRssChannelEnum itunesRssChannel,
    int? limit,
  });
}
