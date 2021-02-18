import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';

abstract class FavouriteRepository {
  Future<void> singleSourceOfTruth(
      {Function(List<MoviesFavouriteData> movieList) onSuccess,
      Function(String message, List<MoviesFavouriteData> movieList) onError});

  Future<void> moreSourceOfTruth(
      {@required List<MoviesFavouriteData> movieList,
      @required int limit,
      @required int offset,
      Function(List<MoviesFavouriteData> movieList) onSuccess,
      Function(String message, List<MoviesFavouriteData> movieList) onError}) {}
}
