import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:songs_app/src/models/feed_entry_model.dart';

import '../widgets/shimmer_widget.dart';

class FeedDetailsPage extends StatelessWidget {
  const FeedDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedEntry =
        ModalRoute.of(context)!.settings.arguments as FeedEntryModel;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'feed_image${feedEntry.id}',
            child: CachedNetworkImage(
              imageUrl: feedEntry.imageUrl,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              placeholder: (context, url) => const ShimmerWidget(
                width: 100,
                height: double.infinity,
              ),
              errorWidget: (context, url, error) => Container(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      feedEntry.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Artist: ${feedEntry.artist}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 16.0),
            child: Row(children: [
              const Icon(Icons.rocket_launch),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(DateFormat.yMMMd().format(feedEntry.releaseDate)),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 16.0),
            child: Row(children: [
              const Icon(Icons.category),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(feedEntry.category),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 16.0),
            child: Row(children: [
              const Icon(Icons.money),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(feedEntry.price.toStringAsFixed(2)),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
