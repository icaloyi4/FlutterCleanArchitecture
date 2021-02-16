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
  int pageDiscover = 1;
  int pagePopular = 1;
  int pageUpcoming = 1;

  HomeBloc(this._repos);

  @override
  void mapEventToState(HomeEvent event) {
    if (event is GetDiscoverMovieEvent && !isOnProcess) {
      isOnProcess = true;
      _getDiscover(event);
    }

    if (event is LoadMoreMovieEvent && !isOnProcess) {
      isOnProcess = true;
      switch (event.type) {
        case 'now':
          pageDiscover++;
          _loadMore(pageDiscover, event.type);
          break;
        case 'popular':
          pagePopular++;
          _loadMore(pagePopular, event.type);
          break;
        case 'upcoming':
          pageUpcoming++;
          _loadMore(pageUpcoming, event.type);
          break;
      }
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
        page: pageDiscover,
        type: 'now',
        onSuccess: (movieList) {
          emitState(SuccessGetDiscoverState(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetDiscoverState(message, movieList));
        });
    isOnProcess = false;
  }

  void _loadMore(int page, String type) async {
    await _repos.moreSourceOfTruth(
        page: page,
        type: type,
        onSuccess: (movieList) {
          switch (type) {
            case 'now':
              emitState(SuccessGetDiscoverState(movieList));
              break;
            case 'popular':
              emitState(SuccessGetPopularState(movieList));
              break;
            case 'upcoming':
              emitState(SuccessGetUpcomingState(movieList));
              break;
          }
        },
        onError: (message, movieList) {
          switch (type) {
            case 'now':
              emitState(FailedGetDiscoverState(message, movieList));
              break;
            case 'popular':
              emitState(FailedGetPopularState(message, movieList));
              break;
            case 'upcoming':
              emitState(FailedGetUpcomingState(message, movieList));
              break;
          }
        });
    isOnProcess = false;
  }

  void _getPopular(GetPopularMovieEvent event) async {
    await _repos.singleSourceOfTruth(
        page: pagePopular,
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
        page: pageUpcoming,
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
