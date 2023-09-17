import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/models/album_entry_model.dart';

final albumListProviderProvider =
    FutureProvider<List<AlbumEntryModel>>((ref) async {
  //TODO: separate API call on a datasource + service, making appropriate error handling
  Response response = await Dio().get(
      'https://itunes.apple.com/us/rss/topalbums/limit=100/json?term=Oliver');
  return (response.data as List)
      .map((e) => AlbumEntryModel.fromJson(e))
      .toList();
});
