import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/core/widget/error_text.dart';
import 'package:movieapp/bloc_dependency_injection/core/widget/shimmer_loading.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/bloc/detail_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/domain/models/review_model.dart';

class ListReview extends StatefulWidget {
  final Movie movie;

  ListReview({@required this.movie});

  @override
  _ListReview createState() => _ListReview();
}

class _ListReview extends BaseState<DetailBloc, DetailState, ListReview> {
  @override
  DetailBloc initBloc() {
    return KiwiContainer().resolve<DetailBloc>();
  }

  @override
  void initState() {
    super.initState();
    bloc.pushEvent(GetDataReview(widget.movie.movieId));
  }

  @override
  Widget mapStateHandler(DetailState state) {
    if (state is SuccessGetDataReview) {
      if (state.review.isNotEmpty)
        return list(state.review);
      else
        return ErrorText(message: 'No review has found in this Movie');
    } else if (state is FailedGetDataReview) {
      return ErrorText(message: state.message);
    } else {
      return ShimmerLoading(type: Axis.horizontal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DetailState>(
          stream: bloc.stateStream,
          initialData: LoadingState(),
          builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
    );
  }

  Widget list(List<ReviewModel> _review) {
    return NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          var metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            if (metrics.pixels == 0) {
              print('At top');
            } else {
              print('At bottom');
              // if (widget.type == 'popular') {
              //   bloc.pushEvent(LoadMoreMovieEvent(type: 'popular'));
              // }
              // if (widget.type == 'upcoming') {
              //   bloc.pushEvent(LoadMoreMovieEvent(type: 'upcoming'));
              // }
            }
            // bloc.pageDiscover++;
            // bloc.pushEvent(GetDiscoverMovieEvent());
          }
          return true;
        },
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _review.length ?? 0,
            itemBuilder: (ctx, pos) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: CachedNetworkImage(
                      imageUrl: '${ApiUrl.IMAGE_URL}${_review[pos].avatarPath}',
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                    // child: Icon(
                    //   Icons.people_alt_outlined,
                    //   size: 75,
                    //   color: Colors.white,
                    // ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      _review[pos].nama_author,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      _review[pos].tgl_comment,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                              // Expanded(
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: Column(
                              //       children: [Text('Isi Coment')],
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(_review[pos].comment),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
