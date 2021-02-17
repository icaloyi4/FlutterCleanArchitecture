part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends BlocEvent {}

class GetDataReview extends DetailEvent {
  final int id_movie;

  GetDataReview(this.id_movie);
}
