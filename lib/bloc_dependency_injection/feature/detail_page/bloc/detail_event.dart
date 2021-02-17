part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends BlocEvent {}

class GetDataReview extends DetailEvent {
  final int id_movie;

  GetDataReview(this.id_movie);
}

class UpdateFavouriteMovie extends DetailEvent {
  final bool favourite;
  final int movie_id;
  final String type;

  UpdateFavouriteMovie(this.favourite, this.movie_id, this.type);
}

class GetMovieFaovourite extends DetailEvent {
  final int movie_id;
  final String type;

  GetMovieFaovourite(this.movie_id, this.type);
}
