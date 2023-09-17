import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/itunes_entry_model.dart';

final albumListProviderProvider =
    FutureProvider<List<ItunesEntryModel>>((ref) async {
  //TODO: separate API call on a datasource + service, making appropriate error handling
  Response response = await Dio().get(
      'https://itunes.apple.com/us/rss/topalbums/limit=100/json?term=Oliver');
  return (jsonDecode(response.data)['feed']['entry'] as List)
      .map((e) => ItunesEntryModel.fromJson(e))
      .toList();
});
