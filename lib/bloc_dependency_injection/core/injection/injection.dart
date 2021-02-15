import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/movies_dao.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_module.dart';
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
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
