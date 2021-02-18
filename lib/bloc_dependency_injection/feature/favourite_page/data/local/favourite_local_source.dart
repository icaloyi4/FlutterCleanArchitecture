import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/movies_dao.dart';

class FavouriteLocalSource {
  final MoviesDao _moviesDao;

  FavouriteLocalSource(this._moviesDao);

  Future<List<MoviesFavouriteData>> getFavouriteMovie(
      int limit, int offset) async {
    return await _moviesDao.getAllFavouriteMovies(limit, offset);
  }
}
