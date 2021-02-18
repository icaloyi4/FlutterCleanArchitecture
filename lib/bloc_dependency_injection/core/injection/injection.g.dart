// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<Dio>((c) => DioModule());
    container.registerSingleton((c) => DatabaseModule());
    container.registerSingleton((c) => MoviesDao(c<DatabaseModule>()));
    container.registerSingleton((c) => MovieRemoteSource(c<Dio>()));
    container.registerSingleton((c) => MovieLocalSource(c<MoviesDao>()));
    container.registerSingleton<MovieRepository>((c) =>
        MovieRepositoryImpl(c<MovieRemoteSource>(), c<MovieLocalSource>()));
    container.registerFactory((c) => HomeBloc(c<MovieRepository>()));
    container.registerSingleton((c) => DetailRemoteSource(c<Dio>()));
    container.registerSingleton((c) => DetailLocalSource(c<MoviesDao>()));
    container.registerSingleton<DetailRepository>((c) =>
        DetailRepositoryImpl(c<DetailRemoteSource>(), c<DetailLocalSource>()));
    container.registerFactory((c) => DetailBloc(c<DetailRepository>()));
    container.registerSingleton((c) => FavouriteRemoteSource(c<Dio>()));
    container.registerSingleton((c) => FavouriteLocalSource(c<MoviesDao>()));
    container.registerSingleton<FavouriteRepository>((c) =>
        FavouriteRepositoryImpl(
            c<FavouriteRemoteSource>(), c<FavouriteLocalSource>()));
    container.registerFactory((c) => FavouriteBloc(c<FavouriteRepository>()));
  }
}
