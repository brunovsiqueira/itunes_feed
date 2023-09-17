import 'package:flutter/material.dart';
import 'package:songs_app/src/widgets/feed_entry_item_widget.dart';

import '../models/feed_entry_model.dart';

class FeedEntrySearchListWidget extends StatefulWidget {
  final List<FeedEntryModel> entryList;
  const FeedEntrySearchListWidget({
    super.key,
    required this.entryList,
  });

  @override
  State<FeedEntrySearchListWidget> createState() =>
      _FeedEntrySearchListWidgetState();
}

class _FeedEntrySearchListWidgetState extends State<FeedEntrySearchListWidget> {
  List<FeedEntryModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = widget.entryList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0) +
              const EdgeInsets.symmetric(horizontal: 8.0),
          child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                onChanged: (searchString) {
                  final lowercaseQueryString = searchString.toLowerCase();

                  // Filter the songs based on the search query
                  setState(() {
                    filteredList = widget.entryList
                        .where((entry) =>
                            entry.name
                                .toLowerCase()
                                .contains(lowercaseQueryString) ||
                            entry.artist
                                .toLowerCase()
                                .contains(lowercaseQueryString))
                        .toList();
                  });
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return [];
            },
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  FeedEntryModel entryItem = filteredList[index];

                  return FeedEntryItemWidget(feedEntry: entryItem);
                },
                itemCount: filteredList.length,
              )),
        ),
      ],
    );
  }
}
