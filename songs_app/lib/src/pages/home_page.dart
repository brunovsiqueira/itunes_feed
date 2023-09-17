import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/models/itunes_entry_model.dart';
import 'package:songs_app/src/providers/itunes_feed_entry_list_provider.dart';
import 'package:songs_app/src/widgets/entry_list_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<ItunesEntryModel> filteredList = [];

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<ItunesEntryModel>> asyncResponse =
        ref.watch(itunesFeedEntryListProvider);

    return asyncResponse.when(
      data: (entryList) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Top 100 Itunes songs'),
          ),
          body: EntrySearchListWidget(
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
        return Scaffold(body: Text('Error'));
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
