import 'package:dartz/dartz.dart';
import 'package:songs_app/src/errors/failures/base_failure.dart';
import 'package:songs_app/src/models/feed_entry_model.dart';

import '../../enums/itunes_rss_channel.dart';

abstract interface class ItunesFeedService {
  Future<Either<BaseFailure, List<FeedEntryModel>>> getFeedEntries({
    required ItunesRssChannelEnum itunesRssChannel,
    int? limit,
  });
}
