part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent extends BlocEvent {}

class GetFavouriteMovie extends FavouriteEvent {}

class LoadMoreFavouriteMovie extends FavouriteEvent {
  final int limit, offset;
  final List<MoviesFavouriteData> movieList;

  LoadMoreFavouriteMovie(this.limit, this.offset, this.movieList);
}
