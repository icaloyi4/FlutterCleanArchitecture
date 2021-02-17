import 'package:flutter/foundation.dart';

class ReviewModel {
  final String id;
  final int id_movie;
  final String nama_author;
  final String tgl_comment;
  final String comment;
  final String avatarPath;

  ReviewModel(
      {@required this.id,
      @required this.id_movie,
      @required this.nama_author,
      @required this.tgl_comment,
      @required this.comment,
      @required this.avatarPath});
}
