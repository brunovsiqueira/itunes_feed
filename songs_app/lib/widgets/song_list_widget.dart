import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/models/itunes_entry_model.dart';
import 'package:songs_app/providers/album_list_provider.dart';

class SongListWidget extends ConsumerWidget {
  const SongListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<ItunesEntryModel>> asyncResponse =
        ref.watch(albumListProviderProvider);
    return asyncResponse.when(
      skipLoadingOnRefresh: false,
      data: (entryList) {
        return ListView.builder(
            itemBuilder: (context, index) {
              ItunesEntryModel entryItem = entryList[index];

              return Text(entryItem.name); //TODO: create EntryItemWidget
            },
            itemCount: entryList.length);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        return Text('Error');
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
