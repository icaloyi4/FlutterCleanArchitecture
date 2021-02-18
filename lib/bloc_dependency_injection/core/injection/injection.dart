import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/movies_dao.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/bloc/detail_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/data/local/detail_local_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/data/remote/detail_remote_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/repository/detail_repository.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/repository/detail_repository_impl.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/bloc/favourite_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/data/local/favourite_local_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/data/remote/favourite_remote_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/domain/repository/favourite_repository.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/domain/repository/favourite_repository_impl.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/bloc/home_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/data/local/movie_local_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/data/remote/movie_remote_source.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/domain/repository/movies_repository.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/domain/repository/movies_repository_impl.dart';

part 'injection.g.dart';

abstract class Injection {
  @Register.singleton(Dio, from: DioModule)
  @Register.singleton(DatabaseModule)
  @Register.singleton(MoviesDao, resolvers: {DatabaseModule: null})
  @Register.singleton(MovieRemoteSource, resolvers: {Dio: null})
  @Register.singleton(MovieLocalSource, resolvers: {MoviesDao: null})
  @Register.singleton(MovieRepository,
      from: MovieRepositoryImpl,
      resolvers: {MovieRemoteSource: null, MovieLocalSource: null})
  @Register.factory(HomeBloc, resolvers: {MovieRepository: null})
  @Register.singleton(DetailRemoteSource, resolvers: {Dio: null})
  @Register.singleton(DetailLocalSource, resolvers: {MoviesDao: null})
  @Register.singleton(DetailRepository,
      from: DetailRepositoryImpl,
      resolvers: {DetailRemoteSource: null, DetailLocalSource: null})
  @Register.factory(DetailBloc, resolvers: {DetailRepository: null})
  @Register.singleton(FavouriteRemoteSource, resolvers: {Dio: null})
  @Register.singleton(FavouriteLocalSource, resolvers: {MoviesDao: null})
  @Register.singleton(FavouriteRepository,
      from: FavouriteRepositoryImpl,
      resolvers: {FavouriteRemoteSource: null, FavouriteLocalSource: null})
  @Register.factory(FavouriteBloc, resolvers: {FavouriteRepository: null})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
