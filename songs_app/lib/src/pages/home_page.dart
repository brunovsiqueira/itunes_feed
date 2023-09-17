import 'package:flutter/material.dart';
import 'package:songs_app/src/widgets/song_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 100 Itunes songs'),
        actions: [
          //TODO: add search feature
        ],
      ),
      body: const SongListWidget(),
    );
  }
}
