part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends BlocEvent {}

class GetDiscoverMovieEvent extends HomeEvent {
  final int page;
  GetDiscoverMovieEvent({@required this.page});
}

class GetPopularMovieEvent extends HomeEvent {
  final int page;
  GetPopularMovieEvent({@required this.page});
}

class GetUpcomingMovieEvent extends HomeEvent {
  final int page;
  GetUpcomingMovieEvent({@required this.page});
}
