import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_event.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_state.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/domain/repository/favourite_repository.dart';

part 'favourite_state.dart';
part 'favourite_event.dart';

class FavouriteBloc extends BaseBloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository _repos;
  bool isOnProcess = false;

  FavouriteBloc(this._repos);
  @override
  void mapEventToState(FavouriteEvent event) {
    if (event is GetFavouriteMovie) {
      isOnProcess = true;
      _getFavouriteMovie(event);
    }

    if (event is LoadMoreFavouriteMovie) {
      isOnProcess = true;
      _getLoadMoreMovie(event);
    }
  }

  void _getFavouriteMovie(GetFavouriteMovie event) async {
    await _repos.singleSourceOfTruth(onSuccess: (movieList) {
      emitState(SuccessGetFavouriteMovie(movieList));
    }, onError: (message, movieList) {
      emitState(FailedGetFavouriteMovie(message, movieList));
    });
    isOnProcess = false;
  }

  void _getLoadMoreMovie(LoadMoreFavouriteMovie event) async {
    await _repos.moreSourceOfTruth(
        limit: event.limit,
        offset: event.offset,
        onSuccess: (movieList) {
          emitState(SuccessGetFavouriteMovie(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetFavouriteMovie(message, movieList));
        },
        movieList: event.movieList);
    isOnProcess = false;
  }
}
