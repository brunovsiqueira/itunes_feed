import 'package:equatable/equatable.dart';

class FeedEntryModel extends Equatable {
  final String name;
  final String imageUrl;
  final double price;
  final String currency;
  final String? contentType;
  final String? rights;
  final String title;
  final String id;
  final String artist;
  final String category;
  final DateTime? releaseDate;

  const FeedEntryModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.currency,
    required this.contentType,
    required this.rights,
    required this.title,
    required this.id,
    required this.artist,
    required this.category,
    required this.releaseDate,
  });

  factory FeedEntryModel.fromJson(Map<String, dynamic> json) {
    final name = json['im:name']['label'];
    final imageUrl = (json['im:image'] as List).last['label'];
    final price = double.parse(json['im:price']['attributes']['amount']);
    final currency = json['im:price']['attributes']['currency'];
    final contentType =
        json['im:contentType']?['im:contentType']?['attributes']?['term'];
    final rights = json['rights'] != null ? (json['rights']?['label']) : null;
    final title = json['title']['label'];
    final id = json['id']['label'];
    final artist = json['im:artist']['label'];
    final category = json['category']['attributes']['term'];
    final releaseDate = json['im:releaseDate'] != null
        ? DateTime.parse(json['im:releaseDate']?['label'])
        : null;

    return FeedEntryModel(
      name: name,
      imageUrl: imageUrl,
      price: price,
      currency: currency,
      contentType: contentType,
      rights: rights,
      title: title,
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
        price,
        currency,
        contentType,
        rights,
        title,
        id,
        artist,
        category,
        releaseDate,
      ];
}
