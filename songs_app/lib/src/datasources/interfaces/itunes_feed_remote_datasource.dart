import 'package:songs_app/src/models/itunes_entry_model.dart';

import '../../enums/itunes_rss_channel.dart';

abstract interface class ItunesFeedRemoteDatsource {
  Future<List<ItunesEntryModel>> getFeedEntries({
    required ItunesRssChannelEnum itunesRssChannel,
    int? limit,
  });
}
