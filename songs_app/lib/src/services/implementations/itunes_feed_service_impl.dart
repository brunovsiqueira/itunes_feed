import 'package:dartz/dartz.dart';
import 'package:songs_app/src/enums/itunes_rss_channel.dart';

import 'package:songs_app/src/errors/failures/base_failure.dart';

import 'package:songs_app/src/models/itunes_entry_model.dart';

import '../../datasources/interfaces/itunes_feed_remote_datasource.dart';
import '../../errors/exceptions/itunes_feed_exceptions.dart';
import '../../errors/failures/itunes_feed_failures.dart';
import '../../errors/failures/unknown_failure.dart';
import '../interfaces/itunes_feed_service.dart';
import '../interfaces/logger_service.dart';

class ItunesFeedServiceImpl implements ItunesFeedService {
  final LoggerService loggerService;
  final ItunesFeedRemoteDatsource itunesFeedRemoteDatsource;

  ItunesFeedServiceImpl({
    required this.loggerService,
    required this.itunesFeedRemoteDatsource,
  });
  @override
  Future<Either<BaseFailure, List<ItunesEntryModel>>> getFeedEntries({
    required ItunesRssChannelEnum itunesRssChannel,
    int? limit,
  }) async {
    BaseFailure? failure;
    try {
      var result = await itunesFeedRemoteDatsource.getFeedEntries(
          itunesRssChannel: itunesRssChannel, limit: limit);
      return Right(result);
    } on GetFeedEntriesException catch (e, stackTrace) {
      failure = GetFeedEntriesFailure(
        exception: e,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      failure = UnknownFailure(
        exception: e,
        stackTrace: stackTrace,
      );
    }
    loggerService.logFailure(failure: failure);
    return Left(failure);
  }
}
