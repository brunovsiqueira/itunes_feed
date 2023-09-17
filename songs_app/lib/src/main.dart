import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/pages/feed_details_page.dart';
import 'package:songs_app/src/pages/feed_home_page.dart';
import 'package:songs_app/src/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FeedHomePage(),
      routes: {
        Routes.feedHome: (context) => const FeedHomePage(),
        Routes.feedEntryDetails: (context) => const FeedDetailsPage(),
      },
    );
  }
}
