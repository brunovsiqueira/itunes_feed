import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:songs_app/src/models/feed_entry_model.dart';

import '../fixtures/fixute_reader.dart';

void main() {
  group('FeedEntryModel.fromJson', () {
    test('should return a valid FeedEntryModel', () {
      // Arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('feed_entry.json'));

      final tFeedEntryModel = FeedEntryModel(
        name: "I've Tried Everything But Therapy (Part 1)",
        imageUrl:
            "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/36/19/66/36196640-1561-dc5e-c6bc-1e5f4befa583/093624856771.jpg/170x170bb.png",
        price: 7.99,
        currency: "USD",
        contentType: "Album",
        rights:
            "℗ 2023 SWIMS Int. under exclusive license to Warner Records Inc.",
        title: "I've Tried Everything But Therapy (Part 1) - Teddy Swims",
        id: "https://music.apple.com/us/album/ive-tried-everything-but-therapy-part-1/1691699589?uo=2",
        artist: "Teddy Swims",
        category: "Pop",
        releaseDate: DateTime.parse("2023-09-15T00:00:00-07:00"),
      );

      // Act
      final result = FeedEntryModel.fromJson(jsonMap);

      // Assert
      expect(result, equals(tFeedEntryModel));
    });
  });
}
