import 'package:dio/dio.dart';
import 'package:movieapp/bloc_dependency_injection/core/error/error_result.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/base_remote.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/response/detail_movie_reponse.dart';

import '../../../../core/remote/dio_model.dart';
import 'movie_reponse.dart';

class MovieRemoteSource extends BaseRemote {
  MovieRemoteSource(Dio dio) : super(dio);
  Future<Result<MovieResponse>> fetchDiscoverMovies(int page) async {
    String url =
        "${ApiUrl.DISCOVER_MOVIES}?api_key=${ApiUrl.TOKEN}&sort_by=popularity.desc&page=$page";
    final result = await getMethod(url,
        converter: (response) => MovieResponse.fromJson(response));
    return result;
  }

  Future<Result<DetailMovieResponse>> fetchDetailMovies(int movieId) async {
    String url = "${ApiUrl.DETAIL_MOVIES}$movieId?api_key=${ApiUrl.TOKEN}";
    final result = await getMethod(url,
        converter: (response) => DetailMovieResponse.fromJson(response));
    return result;
  }
}
