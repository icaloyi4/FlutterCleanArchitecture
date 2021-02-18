import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/entities/movies_entity.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/entities/movies_favourite_entity.dart';

part 'movies_dao.g.dart';

@UseDao(tables: [Movies, MoviesFavourite])
class MoviesDao extends DatabaseAccessor<DatabaseModule> with _$MoviesDaoMixin {
  MoviesDao(DatabaseModule db) : super(db);

  Future insertMovie(Movie movie) =>
      into(movies).insert(movie, mode: InsertMode.insertOrReplace);
  Future updateMovie(Movie movie) => update(movies).replace(movie);

  Future updateMovieFavourite(MoviesFavouriteData movie) =>
      update(moviesFavourite).replace(movie);

  Future insertMovieFavourite(MoviesFavouriteData movie) =>
      into(moviesFavourite).insert(movie, mode: InsertMode.insertOrReplace);

  Future<List<MoviesFavouriteData>> getFavouriteMovie(int movie_id) {
    return (select(moviesFavourite)
          ..where((tbl) => tbl.movieId.equals(movie_id)))
        .get();
  }

  Future deleteMovie(Movie movie) => delete(movies).delete(movie);
  Future deleteMovieByType(String type) {
    return (delete(movies)..where((tbl) => tbl.typeMovie.equals(type))).go();
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

  Future<List<MoviesFavouriteData>> getAllFavouriteMovies(
          int limit, int offset) =>
      (select(moviesFavourite)
            ..where((tbl) => tbl.favourite.equals(true))
            ..limit(limit, offset: offset))
          .get();
}
