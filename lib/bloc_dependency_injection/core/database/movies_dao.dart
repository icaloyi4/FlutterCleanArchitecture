import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/entities/movies_entity.dart';

part 'movies_dao.g.dart';

@UseDao(tables: [Movies])
class MoviesDao extends DatabaseAccessor<DatabaseModule> with _$MoviesDaoMixin {
  MoviesDao(DatabaseModule db) : super(db);

  Future insertMovie(Movie movie) =>
      into(movies).insert(movie, mode: InsertMode.insertOrReplace);
  Future updateMovie(Movie movie) => update(movies).replace(movie);

  Future deleteMovie(Movie movie) => delete(movies).delete(movie);
  Future deleteMovieByType(String type) {
    return (delete(movies)
          ..where((tbl) => tbl.typeMovie.equals(type))
          ..where((tbl) => tbl.favourite.equals(false)))
        .go();
  }

  Future deleteAllMovie() => delete(movies).go();
  Future<List<Movie>> getAllMovie() => select(movies).get();
  Future<List<Movie>> getAllMovieByType(String type) {
    return (select(movies)..where((tbl) => tbl.typeMovie.equals(type))).get();
  }

  Future<List<Movie>> getAllMovieByID(int movie_id, String type) {
    return (select(movies)
          ..where((tbl) => tbl.typeMovie.equals(type))
          ..where((tbl) => tbl.movieId.equals(movie_id)))
        .get();
  }
}
