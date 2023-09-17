import 'package:equatable/equatable.dart';

class FeedEntryModel extends Equatable {
  final String name;
  final String imageUrl;
  final int itemCount;
  final double price;
  final String currency;
  final String contentType;
  final String rights;
  final String title;
  final String link;
  final String id;
  final String artist;
  final String category;
  final String releaseDate;

  const FeedEntryModel({
    required this.name,
    required this.imageUrl,
    required this.itemCount,
    required this.price,
    required this.currency,
    required this.contentType,
    required this.rights,
    required this.title,
    required this.link,
    required this.id,
    required this.artist,
    required this.category,
    required this.releaseDate,
  });

  factory FeedEntryModel.fromJson(Map<String, dynamic> json) {
    final name = json['im:name']['label'];
    final imageUrl = (json['im:image'] as List).last[['label']];
    final itemCount = int.parse(json['im:itemCount']['label']);
    final price = double.parse(json['im:price']['attributes']['amount']);
    final currency = json['im:price']['attributes']['currency'];
    final contentType =
        json['im:contentType']['im:contentType']['attributes']['term'];
    final rights = json['rights']['label'];
    final title = json['title']['label'];
    final link = json['link']['attributes']['href'];
    final id = json['id']['label'];
    final artist = json['im:artist']['label'];
    final category = json['category']['attributes']['term'];
    final releaseDate = json['im:releaseDate']['label'];

    return FeedEntryModel(
      name: name,
      imageUrl: imageUrl,
      itemCount: itemCount,
      price: price,
      currency: currency,
      contentType: contentType,
      rights: rights,
      title: title,
      link: link,
      id: id,
      artist: artist,
      category: category,
      releaseDate: releaseDate,
    );
  }

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        itemCount,
        price,
        currency,
        contentType,
        rights,
        title,
        link,
        id,
        artist,
        category,
        releaseDate,
      ];
}
