import 'package:moor_flutter/moor_flutter.dart';

class MoviesFavourite extends Table {
  IntColumn get Id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  IntColumn get voteCount => integer()();
  TextColumn get voteAverage => text()();
  TextColumn get title => text()();
  TextColumn get posterPath => text()();
  TextColumn get backdropPath => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
  TextColumn get typeMovie => text()();
  BoolColumn get favourite => boolean()();
}
