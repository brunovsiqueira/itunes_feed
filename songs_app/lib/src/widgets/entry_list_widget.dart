import 'package:flutter/material.dart';

import '../models/itunes_entry_model.dart';

class EntrySearchListWidget extends StatefulWidget {
  final List<ItunesEntryModel> entryList;
  const EntrySearchListWidget({
    super.key,
    required this.entryList,
  });

  @override
  State<EntrySearchListWidget> createState() => _EntrySearchListWidgetState();
}

class _EntrySearchListWidgetState extends State<EntrySearchListWidget> {
  List<ItunesEntryModel> filteredList = [];

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
                  ItunesEntryModel entryItem = filteredList[index];

                  return Text(entryItem
                      .name); //TODO: create better EntryItemWidget using main entry attributes
                },
                itemCount: filteredList.length,
              )),
        ),
      ],
    );
  }
}
