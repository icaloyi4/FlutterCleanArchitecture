import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/safe_call_api.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/data/local/movie_local_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/data/remote/movie_remote_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/data/remote/movie_reponse.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/domain/repository/movies_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteSource _remoteSource;
  final MovieLocalSource _localSource;

  MovieRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> singleSourceOfTruth(
      {@required int page,
      @required String type,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError}) async {
    var movies = await _localSource.getAllMovieByType(type);
    onSuccess(movies);

    var result;
    switch (type) {
      case 'now':
        result = await _remoteSource.fetchDiscoverMovies(page);
        break;
      case 'popular':
        result = await _remoteSource.fetchPopularMovies(page);
        break;
      case 'upcoming':
        result = await _remoteSource.fetchUpcomingMovies(page);
        break;
      default:
        result = await _remoteSource.fetchDiscoverMovies(page);
    }

    responseHandler<MovieResponse>(result,
        onSuccess: (MovieResponse response) async {
      _localSource.deleteMovieByType(type);
      movies = response.results.map((element) {
        Movie movie = Movie(
            movieId: element.id,
            voteCount: element.voteCount,
            title: element.title,
            posterPath: element.posterPath,
            backdropPath: element.backdropPath,
            overview: element.overview,
            releaseDate: element.releaseDate,
            typeMovie: type,
            voteAverage: element.voteAverage.toString(),
            Id: null);
        _localSource.insertMovie(movie);
        return movie;
      }).toList();
      onSuccess(movies);
    }, onError: (dioError, code, errorBody) {
      onError("Error : $code ==> $errorBody", movies);
    });
  }

  @override
  Future<void> moreSourceOfTruth(
      {@required int page,
      @required String type,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError}) async {
    var movies;
    // onSuccess(movies);

    var result;
    switch (type) {
      case 'now':
        result = await _remoteSource.fetchDiscoverMovies(page);
        break;
      case 'popular':
        result = await _remoteSource.fetchPopularMovies(page);
        break;
      case 'upcoming':
        result = await _remoteSource.fetchUpcomingMovies(page);
        break;
    }

    responseHandler<MovieResponse>(result,
        onSuccess: (MovieResponse response) async {
      var movies = await _localSource.getAllMovieByType(type);

      var moviesRemote = response.results.map((element) {
        Movie movie = Movie(
            movieId: element.id,
            voteCount: element.voteCount,
            title: element.title,
            posterPath: element.posterPath,
            backdropPath: element.backdropPath,
            overview: element.overview,
            releaseDate: element.releaseDate,
            typeMovie: type,
            voteAverage: element.voteAverage.toString(),
            Id: null);
        _localSource.insertMovie(movie);
        return movie;
      }).toList();
      movies.addAll(moviesRemote);
      onSuccess(movies);
    }, onError: (dioError, code, errorBody) {
      onError("Error : $code ==> $errorBody", movies);
    });
  }
}
