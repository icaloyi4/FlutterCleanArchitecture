import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/movies_dao.dart';

class DetailLocalSource {
  final MoviesDao _moviesDao;

  DetailLocalSource(this._moviesDao);

  Future updateFavourite(Movie movie) async {
    await _moviesDao.updateMovie(movie);
  }

  Future<List<Movie>> getMovieByID(int id_movie, String type) async {
    return await _moviesDao.getAllMovieByID(id_movie, type);
  }
}
