part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends BlocEvent {}

class GetDiscoverMovieEvent extends HomeEvent {}

class LoadMoreMovieEvent extends HomeEvent {
  final String type;

  LoadMoreMovieEvent({@required this.type});
}

class GetPopularMovieEvent extends HomeEvent {}

class GetUpcomingMovieEvent extends HomeEvent {}
