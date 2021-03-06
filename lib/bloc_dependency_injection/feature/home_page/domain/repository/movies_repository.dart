import 'package:flutter/cupertino.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';

abstract class MovieRepository {
  Future<void> singleSourceOfTruth(
      {@required int page,
      @required String type,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError});
  Future<void> moreSourceOfTruth(
      {@required int page,
      @required String type,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError});
}
