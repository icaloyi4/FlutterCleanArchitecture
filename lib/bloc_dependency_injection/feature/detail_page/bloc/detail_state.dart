part of 'detail_bloc.dart';

@immutable
abstract class DetailState extends BlocState {}

class LoadingState extends DetailState {}

class SuccessGetDataReview extends DetailState {
  final List<ReviewModel> review;

  SuccessGetDataReview(this.review);
}

class FailedGetDataReview extends DetailState {
  final String message;
  final List<ReviewModel> review;

  FailedGetDataReview(this.message, this.review);
}
