import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:songs_app/src/models/feed_entry_model.dart';
import 'package:songs_app/src/widgets/shimmer_widget.dart';
import 'package:intl/intl.dart';

import '../routes.dart';

class FeedEntryItemWidget extends StatelessWidget {
  final FeedEntryModel feedEntry;
  const FeedEntryItemWidget({super.key, required this.feedEntry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(feedEntry.title),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.rocket_launch),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child:
                        Text(DateFormat.yMMMd().format(feedEntry.releaseDate)),
                  ),
                ]),
              ],
            ),
          ),
          title: Hero(
            tag: 'feed_image${feedEntry.id}',
            child: CachedNetworkImage(
              imageUrl: feedEntry.imageUrl,
              height: 200,
              fit: BoxFit.contain,
              placeholder: (context, url) => const ShimmerWidget(
                width: 100,
                height: double.infinity,
              ),
              errorWidget: (context, url, error) => Container(),
            ),
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.feedEntryDetails, arguments: feedEntry);
          },
        ),
      ),
    );
  }
}
