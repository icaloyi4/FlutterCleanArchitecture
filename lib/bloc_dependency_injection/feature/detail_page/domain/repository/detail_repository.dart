import 'package:flutter/cupertino.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/models/review_model.dart';

abstract class DetailRepository {
  Future<void> singleSourceOfTruth(
      {@required int page,
      @required int movie_id,
      Function(List<ReviewModel> movieList) onSuccess,
      Function(String message, List<ReviewModel> movieList) onError});
}
