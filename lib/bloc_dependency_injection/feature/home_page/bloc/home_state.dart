part of 'home_bloc.dart';

@immutable
abstract class HomeState extends BlocState {}

class LoadingState extends HomeState {}

class SuccessGetDiscoverState extends HomeState {
  final List<Movie> movieList;
  SuccessGetDiscoverState(this.movieList);
}

class FailedGetDiscoverState extends HomeState {
  final String message;
  final List<Movie> movieList;
  FailedGetDiscoverState(this.message, this.movieList);
}

class SuccessGetPopularState extends HomeState {
  final List<Movie> movieList;
  SuccessGetPopularState(this.movieList);
}

class FailedGetPopularState extends HomeState {
  final String message;
  final List<Movie> movieList;
  FailedGetPopularState(this.message, this.movieList);
}

class SuccessGetUpcomingState extends HomeState {
  final List<Movie> movieList;
  SuccessGetUpcomingState(this.movieList);
}

class FailedGetUpcomingState extends HomeState {
  final String message;
  final List<Movie> movieList;
  FailedGetUpcomingState(this.message, this.movieList);
}
