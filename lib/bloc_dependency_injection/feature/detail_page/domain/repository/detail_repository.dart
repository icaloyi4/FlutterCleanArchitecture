import 'package:flutter/cupertino.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/models/review_model.dart';

abstract class DetailRepository {
  Future<void> singleSourceOfTruth(
      {@required int page,
      @required int movie_id,
      Function(List<ReviewModel> movieList) onSuccess,
      Function(String message, List<ReviewModel> movieList) onError});

  Future<void> getMovieDB(
      {@required int movie_id,
      @required String type,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError});

  Future<void> setFavouriteMovie(
      {@required bool favourite,
      @required int movie_id,
      @required String type,
      Function(Movie movie) onSuccess,
      Function(String message) onError});
}
