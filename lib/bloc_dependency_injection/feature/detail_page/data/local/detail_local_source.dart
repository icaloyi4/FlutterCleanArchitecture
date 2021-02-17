import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/movies_dao.dart';

class DetailLocalSource {
  final MoviesDao _moviesDao;

  DetailLocalSource(this._moviesDao);

  Future updateFavourite(MoviesFavouriteData movie) async {
    await _moviesDao.updateMovieFavourite(movie);
  }

  Future insertFavourite(MoviesFavouriteData movie) async {
    await _moviesDao.insertMovieFavourite(movie);
  }

  Future<List<MoviesFavouriteData>> getFavouritesMovieByID(int movie_id) async {
    return await _moviesDao.getFavouriteMovie(movie_id);
  }

  Future<List<Movie>> getMovieByID(int movie_id, String type) async {
    return await _moviesDao.getAllMovieByID(movie_id, type);
  }
}
