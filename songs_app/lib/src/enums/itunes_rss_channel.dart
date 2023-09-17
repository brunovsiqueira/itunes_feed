enum ItunesRssChannelEnum {
  topsongs(displayName: 'Top songs'),
  topalbums(displayName: 'Top albums'),
  topmovies(displayName: 'Top movies');

  const ItunesRssChannelEnum({required this.displayName});

  final String displayName;
}
