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
  }
}
