import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/response/detail_movie_reponse.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/safe_call_api.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/data/local/detail_local_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/data/remote/detail_remote_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/data/remote/review_response.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/models/review_model.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/repository/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteSource _remoteSource;
  final DetailLocalSource _localSource;

  DetailRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> singleSourceOfTruth(
      {int page,
      int movie_id,
      Function(List<ReviewModel> movieList) onSuccess,
      Function(String message, List<ReviewModel> movieList) onError}) async {
    var result = await _remoteSource.fetchReview(page, movie_id);

    // @override
    // Future<void> singleSourceOfTruth(
    //     {@required int page,
    //     @required String type,
    //     Function(List<Movie> movieList) onSuccess,
    //     Function(String message, List<Movie> movieList) onError}) async {
    //   var movies = await _localSource.getAllMovieByType(type);
    //   onSuccess(movies);

    //   var result;
    //   switch (type) {
    //     case 'now':
    //       result = await _remoteSource.fetchDiscoverMovies(page);
    //       break;
    //     case 'popular':
    //       result = await _remoteSource.fetchPopularMovies(page);
    //       break;
    //     case 'upcoming':
    //       result = await _remoteSource.fetchUpcomingMovies(page);
    //       break;
    //     default:
    //       result = await _remoteSource.fetchDiscoverMovies(page);
    //   }
    List<ReviewModel> review = [];

    responseHandler<ReviewResponse>(result,
        onSuccess: (ReviewResponse response) async {
      review = response.results.map((element) {
        ReviewModel reviewModel = ReviewModel(
            id_movie: movie_id,
            id: element.id,
            tgl_comment: element.createdAt,
            comment: element.content,
            nama_author: element.author,
            avatarPath: element.authorDetails.avatarPath);
        return reviewModel;
      }).toList();
      onSuccess(review);
    }, onError: (dioError, code, errorBody) {
      onError("Error : $code ==> $errorBody", review);
    });
  }
}
