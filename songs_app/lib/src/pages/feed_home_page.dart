import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/enums/itunes_rss_channel.dart';
import 'package:songs_app/src/models/feed_entry_model.dart';
import 'package:songs_app/src/providers/itunes_feed_entry_list_provider.dart';
import 'package:songs_app/src/widgets/feed_entry_list_widget.dart';

import '../errors/failures/base_failure.dart';
import '../widgets/failure_widget.dart';

class FeedHomePage extends ConsumerStatefulWidget {
  const FeedHomePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedHomePageState();
}

class _FeedHomePageState extends ConsumerState<FeedHomePage> {
  List<FeedEntryModel> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Top 100 Itunes'),
            bottom: TabBar(tabs: [
              Tab(text: ItunesRssChannelEnum.topalbums.displayName),
              Tab(text: ItunesRssChannelEnum.topsongs.displayName),
              Tab(text: ItunesRssChannelEnum.topmovies.displayName),
            ]),
          ),
          body: TabBarView(
            children: [
              FeedTab(
                  asyncResponse: ref.watch(itunesFeedEntryListProvider(
                      ItunesRssChannelEnum.topalbums))),
              FeedTab(
                  asyncResponse: ref.watch(itunesFeedEntryListProvider(
                      ItunesRssChannelEnum.topsongs))),
              FeedTab(
                  asyncResponse: ref.watch(itunesFeedEntryListProvider(
                      ItunesRssChannelEnum.topmovies))),
            ],
          )),
    );
  }
}

class FeedTab extends ConsumerWidget {
  final AsyncValue<List<FeedEntryModel>> asyncResponse;
  const FeedTab({super.key, required this.asyncResponse});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncResponse.when(
      skipLoadingOnRefresh: false,
      data: (entryList) {
        return FeedEntrySearchListWidget(entryList: entryList);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Top 100 Itunes'),
          ),
          body: FailureWidget(
            failure: error as BaseFailure,
            refreshCallback: () {
              ref.invalidate(
                  itunesFeedEntryListProvider(ItunesRssChannelEnum.topalbums));
            },
          ),
        );
      },
    );
  }
}
