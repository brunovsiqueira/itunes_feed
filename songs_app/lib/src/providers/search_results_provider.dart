import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/models/itunes_entry_model.dart';
import 'package:songs_app/src/providers/album_list_provider.dart';

final searchResultsProvider =
    Provider.family<List<ItunesEntryModel>, String>((ref, query) {
  ref.watch(albumListProvider).whenData((value) {
    final lowercaseQuery = query.toLowerCase();

    // Filter the songs based on the search query
    return value
        .where((song) =>
            song.title.toLowerCase().contains(lowercaseQuery) ||
            song.artist.toLowerCase().contains(lowercaseQuery))
        .toList();
  });

  return [];
});
