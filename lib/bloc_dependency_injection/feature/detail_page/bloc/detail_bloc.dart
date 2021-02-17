import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_event.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_state.dart';
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
}
