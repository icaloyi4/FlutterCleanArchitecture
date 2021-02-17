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

class SuccessUpdateFavourite extends DetailState {
  final MoviesFavouriteData movie;

  SuccessUpdateFavourite(this.movie);
}

class FailedUpdateFavourite extends DetailState {
  final String message;

  FailedUpdateFavourite(this.message);
}

class SuccessGetFavourite extends DetailState {
  final MoviesFavouriteData movie;

  SuccessGetFavourite(this.movie);
}

class FailedGetFavourite extends DetailState {
  final String message;

  FailedGetFavourite(this.message);
}
