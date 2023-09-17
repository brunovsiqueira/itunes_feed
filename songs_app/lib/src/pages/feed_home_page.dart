import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/models/feed_entry_model.dart';
import 'package:songs_app/src/providers/itunes_feed_entry_list_provider.dart';
import 'package:songs_app/src/widgets/feed_entry_list_widget.dart';

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
    AsyncValue<List<FeedEntryModel>> asyncResponse =
        ref.watch(itunesFeedEntryListProvider);

    return asyncResponse.when(
      data: (entryList) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Top 100 Itunes'),
          ),
          body: FeedEntrySearchListWidget(
            entryList: entryList,
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(), //TODO: implement loading using shimmer
        ),
      ),
      error: (error, stackTrace) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Top 100 Itunes'),
            ),
            body: Text('Error'));
        // return FailureWidget(
        //   failure: error as BaseFailure,
        //   refreshCallback: () {
        //     ref.invalidate(roversPhotosProvider(RoverNameEnum.curiosity));
        //   },
        // ); //TODO: implement FailureWidget and failures
      },
    );
  }
}
