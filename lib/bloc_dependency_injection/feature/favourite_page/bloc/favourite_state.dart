part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState extends BlocState {}

class LoadingState extends FavouriteState {}

class SuccessGetFavouriteMovie extends FavouriteState {
  final List<MoviesFavouriteData> movies;

  SuccessGetFavouriteMovie(this.movies);
}

class FailedGetFavouriteMovie extends FavouriteState {
  final String message;
  final List<MoviesFavouriteData> movies;

  FailedGetFavouriteMovie(this.message, this.movies);
}
