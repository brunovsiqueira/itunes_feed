import 'package:songs_app/src/models/itunes_entry_model.dart';

abstract interface class ItunesFeedRemoteDatsource {
  Future<List<ItunesEntryModel>> getFeedEntries({
    required itunesRssChannel,
    int? limit,
  });
}
