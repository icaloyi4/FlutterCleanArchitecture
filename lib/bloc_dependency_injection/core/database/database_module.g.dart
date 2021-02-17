// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int Id;
  final int movieId;
  final int voteCount;
  final String voteAverage;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String typeMovie;
  Movie(
      {@required this.Id,
      @required this.movieId,
      @required this.voteCount,
      @required this.voteAverage,
      @required this.title,
      @required this.posterPath,
      @required this.backdropPath,
      @required this.overview,
      @required this.releaseDate,
      @required this.typeMovie});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Movie(
      Id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      movieId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}movie_id']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      voteAverage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      releaseDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      typeMovie: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}type_movie']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || Id != null) {
      map['id'] = Variable<int>(Id);
    }
    if (!nullToAbsent || movieId != null) {
      map['movie_id'] = Variable<int>(movieId);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<String>(voteAverage);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    if (!nullToAbsent || typeMovie != null) {
      map['type_movie'] = Variable<String>(typeMovie);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      Id: Id == null && nullToAbsent ? const Value.absent() : Value(Id),
      movieId: movieId == null && nullToAbsent
          ? const Value.absent()
          : Value(movieId),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      typeMovie: typeMovie == null && nullToAbsent
          ? const Value.absent()
          : Value(typeMovie),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      Id: serializer.fromJson<int>(json['Id']),
      movieId: serializer.fromJson<int>(json['movieId']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      voteAverage: serializer.fromJson<String>(json['voteAverage']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      typeMovie: serializer.fromJson<String>(json['typeMovie']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'Id': serializer.toJson<int>(Id),
      'movieId': serializer.toJson<int>(movieId),
      'voteCount': serializer.toJson<int>(voteCount),
      'voteAverage': serializer.toJson<String>(voteAverage),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String>(posterPath),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'typeMovie': serializer.toJson<String>(typeMovie),
    };
  }

  Movie copyWith(
          {int Id,
          int movieId,
          int voteCount,
          String voteAverage,
          String title,
          String posterPath,
          String backdropPath,
          String overview,
          String releaseDate,
          String typeMovie}) =>
      Movie(
        Id: Id ?? this.Id,
        movieId: movieId ?? this.movieId,
        voteCount: voteCount ?? this.voteCount,
        voteAverage: voteAverage ?? this.voteAverage,
        title: title ?? this.title,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        typeMovie: typeMovie ?? this.typeMovie,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('Id: $Id, ')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('typeMovie: $typeMovie')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      Id.hashCode,
      $mrjc(
          movieId.hashCode,
          $mrjc(
              voteCount.hashCode,
              $mrjc(
                  voteAverage.hashCode,
                  $mrjc(
                      title.hashCode,
                      $mrjc(
                          posterPath.hashCode,
                          $mrjc(
                              backdropPath.hashCode,
                              $mrjc(
                                  overview.hashCode,
                                  $mrjc(releaseDate.hashCode,
                                      typeMovie.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Movie &&
          other.Id == this.Id &&
          other.movieId == this.movieId &&
          other.voteCount == this.voteCount &&
          other.voteAverage == this.voteAverage &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate &&
          other.typeMovie == this.typeMovie);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> Id;
  final Value<int> movieId;
  final Value<int> voteCount;
  final Value<String> voteAverage;
  final Value<String> title;
  final Value<String> posterPath;
  final Value<String> backdropPath;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<String> typeMovie;
  const MoviesCompanion({
    this.Id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.typeMovie = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.Id = const Value.absent(),
    @required int movieId,
    @required int voteCount,
    @required String voteAverage,
    @required String title,
    @required String posterPath,
    @required String backdropPath,
    @required String overview,
    @required String releaseDate,
    @required String typeMovie,
  })  : movieId = Value(movieId),
        voteCount = Value(voteCount),
        voteAverage = Value(voteAverage),
        title = Value(title),
        posterPath = Value(posterPath),
        backdropPath = Value(backdropPath),
        overview = Value(overview),
        releaseDate = Value(releaseDate),
        typeMovie = Value(typeMovie);
  static Insertable<Movie> custom({
    Expression<int> Id,
    Expression<int> movieId,
    Expression<int> voteCount,
    Expression<String> voteAverage,
    Expression<String> title,
    Expression<String> posterPath,
    Expression<String> backdropPath,
    Expression<String> overview,
    Expression<String> releaseDate,
    Expression<String> typeMovie,
  }) {
    return RawValuesInsertable({
      if (Id != null) 'id': Id,
      if (movieId != null) 'movie_id': movieId,
      if (voteCount != null) 'vote_count': voteCount,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (typeMovie != null) 'type_movie': typeMovie,
    });
  }

  MoviesCompanion copyWith(
      {Value<int> Id,
      Value<int> movieId,
      Value<int> voteCount,
      Value<String> voteAverage,
      Value<String> title,
      Value<String> posterPath,
      Value<String> backdropPath,
      Value<String> overview,
      Value<String> releaseDate,
      Value<String> typeMovie}) {
    return MoviesCompanion(
      Id: Id ?? this.Id,
      movieId: movieId ?? this.movieId,
      voteCount: voteCount ?? this.voteCount,
      voteAverage: voteAverage ?? this.voteAverage,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      typeMovie: typeMovie ?? this.typeMovie,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (Id.present) {
      map['id'] = Variable<int>(Id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<String>(voteAverage.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (typeMovie.present) {
      map['type_movie'] = Variable<String>(typeMovie.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('Id: $Id, ')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('typeMovie: $typeMovie')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _IdMeta = const VerificationMeta('Id');
  GeneratedIntColumn _Id;
  @override
  GeneratedIntColumn get Id => _Id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  GeneratedIntColumn _movieId;
  @override
  GeneratedIntColumn get movieId => _movieId ??= _constructMovieId();
  GeneratedIntColumn _constructMovieId() {
    return GeneratedIntColumn(
      'movie_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  GeneratedTextColumn _voteAverage;
  @override
  GeneratedTextColumn get voteAverage =>
      _voteAverage ??= _constructVoteAverage();
  GeneratedTextColumn _constructVoteAverage() {
    return GeneratedTextColumn(
      'vote_average',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  GeneratedTextColumn _releaseDate;
  @override
  GeneratedTextColumn get releaseDate =>
      _releaseDate ??= _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMovieMeta = const VerificationMeta('typeMovie');
  GeneratedTextColumn _typeMovie;
  @override
  GeneratedTextColumn get typeMovie => _typeMovie ??= _constructTypeMovie();
  GeneratedTextColumn _constructTypeMovie() {
    return GeneratedTextColumn(
      'type_movie',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        Id,
        movieId,
        voteCount,
        voteAverage,
        title,
        posterPath,
        backdropPath,
        overview,
        releaseDate,
        typeMovie
      ];
  @override
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_IdMeta, Id.isAcceptableOrUnknown(data['id'], _IdMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id'], _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count'], _voteCountMeta));
    } else if (isInserting) {
      context.missing(_voteCountMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average'], _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path'], _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path'], _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview'], _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date'], _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('type_movie')) {
      context.handle(_typeMovieMeta,
          typeMovie.isAcceptableOrUnknown(data['type_movie'], _typeMovieMeta));
    } else if (isInserting) {
      context.missing(_typeMovieMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {Id};
  @override
  Movie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Movie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

class MoviesFavouriteData extends DataClass
    implements Insertable<MoviesFavouriteData> {
  final int Id;
  final int movieId;
  final int voteCount;
  final String voteAverage;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String typeMovie;
  final bool favourite;
  MoviesFavouriteData(
      {@required this.Id,
      @required this.movieId,
      @required this.voteCount,
      @required this.voteAverage,
      @required this.title,
      @required this.posterPath,
      @required this.backdropPath,
      @required this.overview,
      @required this.releaseDate,
      @required this.typeMovie,
      @required this.favourite});
  factory MoviesFavouriteData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return MoviesFavouriteData(
      Id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      movieId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}movie_id']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      voteAverage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      releaseDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      typeMovie: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}type_movie']),
      favourite:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}favourite']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || Id != null) {
      map['id'] = Variable<int>(Id);
    }
    if (!nullToAbsent || movieId != null) {
      map['movie_id'] = Variable<int>(movieId);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<String>(voteAverage);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    if (!nullToAbsent || typeMovie != null) {
      map['type_movie'] = Variable<String>(typeMovie);
    }
    if (!nullToAbsent || favourite != null) {
      map['favourite'] = Variable<bool>(favourite);
    }
    return map;
  }

  MoviesFavouriteCompanion toCompanion(bool nullToAbsent) {
    return MoviesFavouriteCompanion(
      Id: Id == null && nullToAbsent ? const Value.absent() : Value(Id),
      movieId: movieId == null && nullToAbsent
          ? const Value.absent()
          : Value(movieId),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      typeMovie: typeMovie == null && nullToAbsent
          ? const Value.absent()
          : Value(typeMovie),
      favourite: favourite == null && nullToAbsent
          ? const Value.absent()
          : Value(favourite),
    );
  }

  factory MoviesFavouriteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoviesFavouriteData(
      Id: serializer.fromJson<int>(json['Id']),
      movieId: serializer.fromJson<int>(json['movieId']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      voteAverage: serializer.fromJson<String>(json['voteAverage']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      typeMovie: serializer.fromJson<String>(json['typeMovie']),
      favourite: serializer.fromJson<bool>(json['favourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'Id': serializer.toJson<int>(Id),
      'movieId': serializer.toJson<int>(movieId),
      'voteCount': serializer.toJson<int>(voteCount),
      'voteAverage': serializer.toJson<String>(voteAverage),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String>(posterPath),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'typeMovie': serializer.toJson<String>(typeMovie),
      'favourite': serializer.toJson<bool>(favourite),
    };
  }

  MoviesFavouriteData copyWith(
          {int Id,
          int movieId,
          int voteCount,
          String voteAverage,
          String title,
          String posterPath,
          String backdropPath,
          String overview,
          String releaseDate,
          String typeMovie,
          bool favourite}) =>
      MoviesFavouriteData(
        Id: Id ?? this.Id,
        movieId: movieId ?? this.movieId,
        voteCount: voteCount ?? this.voteCount,
        voteAverage: voteAverage ?? this.voteAverage,
        title: title ?? this.title,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        typeMovie: typeMovie ?? this.typeMovie,
        favourite: favourite ?? this.favourite,
      );
  @override
  String toString() {
    return (StringBuffer('MoviesFavouriteData(')
          ..write('Id: $Id, ')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('typeMovie: $typeMovie, ')
          ..write('favourite: $favourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      Id.hashCode,
      $mrjc(
          movieId.hashCode,
          $mrjc(
              voteCount.hashCode,
              $mrjc(
                  voteAverage.hashCode,
                  $mrjc(
                      title.hashCode,
                      $mrjc(
                          posterPath.hashCode,
                          $mrjc(
                              backdropPath.hashCode,
                              $mrjc(
                                  overview.hashCode,
                                  $mrjc(
                                      releaseDate.hashCode,
                                      $mrjc(typeMovie.hashCode,
                                          favourite.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MoviesFavouriteData &&
          other.Id == this.Id &&
          other.movieId == this.movieId &&
          other.voteCount == this.voteCount &&
          other.voteAverage == this.voteAverage &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate &&
          other.typeMovie == this.typeMovie &&
          other.favourite == this.favourite);
}

class MoviesFavouriteCompanion extends UpdateCompanion<MoviesFavouriteData> {
  final Value<int> Id;
  final Value<int> movieId;
  final Value<int> voteCount;
  final Value<String> voteAverage;
  final Value<String> title;
  final Value<String> posterPath;
  final Value<String> backdropPath;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<String> typeMovie;
  final Value<bool> favourite;
  const MoviesFavouriteCompanion({
    this.Id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.typeMovie = const Value.absent(),
    this.favourite = const Value.absent(),
  });
  MoviesFavouriteCompanion.insert({
    this.Id = const Value.absent(),
    @required int movieId,
    @required int voteCount,
    @required String voteAverage,
    @required String title,
    @required String posterPath,
    @required String backdropPath,
    @required String overview,
    @required String releaseDate,
    @required String typeMovie,
    @required bool favourite,
  })  : movieId = Value(movieId),
        voteCount = Value(voteCount),
        voteAverage = Value(voteAverage),
        title = Value(title),
        posterPath = Value(posterPath),
        backdropPath = Value(backdropPath),
        overview = Value(overview),
        releaseDate = Value(releaseDate),
        typeMovie = Value(typeMovie),
        favourite = Value(favourite);
  static Insertable<MoviesFavouriteData> custom({
    Expression<int> Id,
    Expression<int> movieId,
    Expression<int> voteCount,
    Expression<String> voteAverage,
    Expression<String> title,
    Expression<String> posterPath,
    Expression<String> backdropPath,
    Expression<String> overview,
    Expression<String> releaseDate,
    Expression<String> typeMovie,
    Expression<bool> favourite,
  }) {
    return RawValuesInsertable({
      if (Id != null) 'id': Id,
      if (movieId != null) 'movie_id': movieId,
      if (voteCount != null) 'vote_count': voteCount,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (typeMovie != null) 'type_movie': typeMovie,
      if (favourite != null) 'favourite': favourite,
    });
  }

  MoviesFavouriteCompanion copyWith(
      {Value<int> Id,
      Value<int> movieId,
      Value<int> voteCount,
      Value<String> voteAverage,
      Value<String> title,
      Value<String> posterPath,
      Value<String> backdropPath,
      Value<String> overview,
      Value<String> releaseDate,
      Value<String> typeMovie,
      Value<bool> favourite}) {
    return MoviesFavouriteCompanion(
      Id: Id ?? this.Id,
      movieId: movieId ?? this.movieId,
      voteCount: voteCount ?? this.voteCount,
      voteAverage: voteAverage ?? this.voteAverage,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      typeMovie: typeMovie ?? this.typeMovie,
      favourite: favourite ?? this.favourite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (Id.present) {
      map['id'] = Variable<int>(Id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<String>(voteAverage.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (typeMovie.present) {
      map['type_movie'] = Variable<String>(typeMovie.value);
    }
    if (favourite.present) {
      map['favourite'] = Variable<bool>(favourite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesFavouriteCompanion(')
          ..write('Id: $Id, ')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('typeMovie: $typeMovie, ')
          ..write('favourite: $favourite')
          ..write(')'))
        .toString();
  }
}

class $MoviesFavouriteTable extends MoviesFavourite
    with TableInfo<$MoviesFavouriteTable, MoviesFavouriteData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesFavouriteTable(this._db, [this._alias]);
  final VerificationMeta _IdMeta = const VerificationMeta('Id');
  GeneratedIntColumn _Id;
  @override
  GeneratedIntColumn get Id => _Id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  GeneratedIntColumn _movieId;
  @override
  GeneratedIntColumn get movieId => _movieId ??= _constructMovieId();
  GeneratedIntColumn _constructMovieId() {
    return GeneratedIntColumn(
      'movie_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  GeneratedTextColumn _voteAverage;
  @override
  GeneratedTextColumn get voteAverage =>
      _voteAverage ??= _constructVoteAverage();
  GeneratedTextColumn _constructVoteAverage() {
    return GeneratedTextColumn(
      'vote_average',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  GeneratedTextColumn _releaseDate;
  @override
  GeneratedTextColumn get releaseDate =>
      _releaseDate ??= _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMovieMeta = const VerificationMeta('typeMovie');
  GeneratedTextColumn _typeMovie;
  @override
  GeneratedTextColumn get typeMovie => _typeMovie ??= _constructTypeMovie();
  GeneratedTextColumn _constructTypeMovie() {
    return GeneratedTextColumn(
      'type_movie',
      $tableName,
      false,
    );
  }

  final VerificationMeta _favouriteMeta = const VerificationMeta('favourite');
  GeneratedBoolColumn _favourite;
  @override
  GeneratedBoolColumn get favourite => _favourite ??= _constructFavourite();
  GeneratedBoolColumn _constructFavourite() {
    return GeneratedBoolColumn(
      'favourite',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        Id,
        movieId,
        voteCount,
        voteAverage,
        title,
        posterPath,
        backdropPath,
        overview,
        releaseDate,
        typeMovie,
        favourite
      ];
  @override
  $MoviesFavouriteTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies_favourite';
  @override
  final String actualTableName = 'movies_favourite';
  @override
  VerificationContext validateIntegrity(
      Insertable<MoviesFavouriteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_IdMeta, Id.isAcceptableOrUnknown(data['id'], _IdMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id'], _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count'], _voteCountMeta));
    } else if (isInserting) {
      context.missing(_voteCountMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average'], _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path'], _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path'], _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview'], _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date'], _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('type_movie')) {
      context.handle(_typeMovieMeta,
          typeMovie.isAcceptableOrUnknown(data['type_movie'], _typeMovieMeta));
    } else if (isInserting) {
      context.missing(_typeMovieMeta);
    }
    if (data.containsKey('favourite')) {
      context.handle(_favouriteMeta,
          favourite.isAcceptableOrUnknown(data['favourite'], _favouriteMeta));
    } else if (isInserting) {
      context.missing(_favouriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {Id};
  @override
  MoviesFavouriteData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MoviesFavouriteData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoviesFavouriteTable createAlias(String alias) {
    return $MoviesFavouriteTable(_db, alias);
  }
}

abstract class _$DatabaseModule extends GeneratedDatabase {
  _$DatabaseModule(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  $MoviesFavouriteTable _moviesFavourite;
  $MoviesFavouriteTable get moviesFavourite =>
      _moviesFavourite ??= $MoviesFavouriteTable(this);
  MoviesDao _moviesDao;
  MoviesDao get moviesDao => _moviesDao ??= MoviesDao(this as DatabaseModule);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies, moviesFavourite];
}
