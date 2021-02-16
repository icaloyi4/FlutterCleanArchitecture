import 'package:flutter/foundation.dart';

import 'package:movieapp/bloc_dependency_injection/core/base/base_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_event.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_state.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/domain/repository/movies_repository.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRepository _repos;
  bool isOnProcess = false;

  HomeBloc(this._repos);

  @override
  void mapEventToState(HomeEvent event) {
    if (event is GetDiscoverMovieEvent && !isOnProcess) {
      isOnProcess = true;
      _getDiscover(event);
    }
    if (event is GetPopularMovieEvent && !isOnProcess) {
      isOnProcess = true;
      _getPopular(event);
    }
    if (event is GetUpcomingMovieEvent && !isOnProcess) {
      isOnProcess = true;
      _getUpcoming(event);
    }
  }

  void _getDiscover(GetDiscoverMovieEvent event) async {
    await _repos.singleSourceOfTruth(
        page: event.page,
        type: 'now',
        onSuccess: (movieList) {
          emitState(SuccessGetDiscoverState(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetDiscoverState(message, movieList));
        });
    isOnProcess = false;
  }

  void _getPopular(GetPopularMovieEvent event) async {
    await _repos.singleSourceOfTruth(
        page: event.page,
        type: 'popular',
        onSuccess: (movieList) {
          emitState(SuccessGetPopularState(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetPopularState(message, movieList));
        });
    isOnProcess = false;
  }

  void _getUpcoming(GetUpcomingMovieEvent event) async {
    await _repos.singleSourceOfTruth(
        page: event.page,
        type: 'upcoming',
        onSuccess: (movieList) {
          emitState(SuccessGetUpcomingState(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetUpcomingState(message, movieList));
        });
    isOnProcess = false;
  }
}
