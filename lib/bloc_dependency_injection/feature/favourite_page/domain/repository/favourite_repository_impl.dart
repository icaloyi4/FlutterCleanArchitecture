import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/data/local/favourite_local_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/data/remote/favourite_remote_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/domain/repository/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final FavouriteRemoteSource _remoteSource;
  final FavouriteLocalSource _localSource;

  FavouriteRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> singleSourceOfTruth(
      {Function(List<MoviesFavouriteData> movieList) onSuccess,
      Function(String message, List<MoviesFavouriteData> movieList)
          onError}) async {
    try {
      var movies = await _localSource.getFavouriteMovie(5, 0);
      onSuccess(movies);
    } on Exception catch (e) {
      onError(e.toString(), []);
    }
  }

  @override
  Future<void> moreSourceOfTruth(
      {List<MoviesFavouriteData> movieList,
      int limit,
      int offset,
      Function(List<MoviesFavouriteData> movieList) onSuccess,
      Function(String message, List<MoviesFavouriteData> movieList)
          onError}) async {
    try {
      var movies = await _localSource.getFavouriteMovie(limit, offset);
      movieList.addAll(movies);
      onSuccess(movieList);
    } on Exception catch (e) {
      onError(e.toString(), []);
    }
  }
}
