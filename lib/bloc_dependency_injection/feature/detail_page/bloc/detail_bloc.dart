import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_event.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_state.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/entities/movies_favourite_entity.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/models/review_model.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/repository/detail_repository.dart';

part 'detail_state.dart';
part 'detail_event.dart';

class DetailBloc extends BaseBloc<DetailEvent, DetailState> {
  final DetailRepository _repos;
  bool isOnProcess = false;

  DetailBloc(this._repos);

  @override
  void mapEventToState(DetailEvent event) {
    if (event is GetDataReview && !isOnProcess) {
      isOnProcess = true;
      _getReview(event);
    }

    if (event is UpdateFavouriteMovie && !isOnProcess) {
      isOnProcess = true;
      _updateFavouriteMovie(event);
    }

    if (event is GetMovieFaovourite && !isOnProcess) {
      isOnProcess = true;
      _getMovie(event);
    }
  }

  void _getReview(GetDataReview event) async {
    await _repos.singleSourceOfTruth(
        page: 1,
        movie_id: event.id_movie,
        onSuccess: (movieList) {
          emitState(SuccessGetDataReview(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetDataReview(message, movieList));
        });
    isOnProcess = false;
  }

  void _getMovie(GetMovieFaovourite event) async {
    await _repos.getMovieDB(
        movie_id: event.movie_id,
        onSuccess: (movieList) {
          emitState(SuccessGetFavourite(movieList.last));
        },
        onError: (message, movieList) {
          emitState(FailedGetFavourite(message));
        },
        type: event.type);
    isOnProcess = false;
  }

  void _updateFavouriteMovie(UpdateFavouriteMovie event) async {
    await _repos.setFavouriteMovie(
        onSuccess: (movie) {
          emitState(SuccessUpdateFavourite(movie));
        },
        onError: (message) {
          emitState(FailedUpdateFavourite(message));
        },
        favourite: event.favourite,
        movie_id: event.movie_id,
        type: event.type,
        movie: event.movie);
    isOnProcess = false;
  }
}
