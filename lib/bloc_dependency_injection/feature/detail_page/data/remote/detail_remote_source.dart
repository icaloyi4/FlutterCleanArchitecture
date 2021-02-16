import 'package:dio/dio.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/base_remote.dart';

class DetailRemoteSource extends BaseRemote {
  DetailRemoteSource(Dio dio) : super(dio);
  // Future<Result<MovieResponse>> fetchDiscoverMovies(int page) async {
  //   String url =
  //       "${ApiUrl.DISCOVER_MOVIES}?api_key=${ApiUrl.TOKEN}&sort_by=popularity.desc&page=$page";
  //   final result = await getMethod(url,
  //       converter: (response) => MovieResponse.fromJson(response));
  //   return result;
  // }

  // Future<Result<MovieResponse>> fetchPopularMovies(int page) async {
  //   String url =
  //       "${ApiUrl.POPULAR_MOVIES}?api_key=${ApiUrl.TOKEN}&sort_by=popularity.desc&page=$page";
  //   final result = await getMethod(url,
  //       converter: (response) => MovieResponse.fromJson(response));
  //   return result;
  // }

  // Future<Result<MovieResponse>> fetchUpcomingMovies(int page) async {
  //   String url =
  //       "${ApiUrl.UPCOMING_MOVIES}?api_key=${ApiUrl.TOKEN}&sort_by=popularity.desc&page=$page";
  //   final result = await getMethod(url,
  //       converter: (response) => MovieResponse.fromJson(response));
  //   return result;
  // }

  // Future<Result<DetailMovieResponse>> fetchDetailMovies(int movieId) async {
  //   String url = "${ApiUrl.DETAIL_MOVIES}$movieId?api_key=${ApiUrl.TOKEN}";
  //   final result = await getMethod(url,
  //       converter: (response) => DetailMovieResponse.fromJson(response));
  //   return result;
  // }
}
