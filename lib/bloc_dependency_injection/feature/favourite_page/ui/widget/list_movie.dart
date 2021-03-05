import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart' as r;
import 'package:movieapp/bloc_dependency_injection/core/widget/error_text.dart';
import 'package:movieapp/bloc_dependency_injection/core/widget/shimmer_loading.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/bloc/favourite_bloc.dart';

class ListFavouriteMovie extends StatefulWidget {
  @override
  _ListFavouriteMovie createState() => _ListFavouriteMovie();
}

class _ListFavouriteMovie
    extends BaseState<FavouriteBloc, FavouriteState, ListFavouriteMovie> {
  int limit = 5;
  int offset = 0;

  @override
  FavouriteBloc initBloc() {
    return KiwiContainer().resolve<FavouriteBloc>();
  }

  @override
  void initState() {
    super.initState();
    bloc.pushEvent(GetFavouriteMovie());
  }

  @override
  Widget mapStateHandler(FavouriteState state) {
    if (state is SuccessGetFavouriteMovie) {
      if (state.movies.isNotEmpty) {
        return list(state.movies);
      } else {
        return ErrorText(message: 'Tidak ada film yang difavoritkan');
      }
    } else if (state is FailedGetFavouriteMovie) {
      return ErrorText(message: state.message);
    } else {
      return ShimmerLoading(type: Axis.horizontal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<FavouriteState>(
          stream: bloc.stateStream,
          initialData: LoadingState(),
          builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
    );
  }

  Widget list(List<MoviesFavouriteData> _movie) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        var metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          if (metrics.pixels == 0) {
            print('At top');
          } else {
            print('At bottom');
            offset = offset + limit;
            bloc.pushEvent(LoadMoreFavouriteMovie(limit, offset, _movie));
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
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 8),
          itemCount: _movie.length ?? 0,
          itemBuilder: (ctx, pos) {
            MoviesFavouriteData movie = _movie[pos];
            return GestureDetector(
              onTap: () {
                Movie mov = Movie(
                    Id: movie.Id,
                    movieId: movie.movieId,
                    voteCount: movie.voteCount,
                    voteAverage: movie.voteAverage,
                    title: movie.title,
                    posterPath: movie.posterPath,
                    backdropPath: movie.backdropPath,
                    overview: movie.overview,
                    releaseDate: movie.releaseDate,
                    typeMovie: movie.typeMovie);
                    Get.toNamed(r.Routing.DETAIL_MOVIE,
                        arguments: mov).then((value) {
                          offset = 0;
                  bloc.pushEvent(GetFavouriteMovie());
                        });
                // Navigator.pushNamed(context, Routing.DETAIL_MOVIE,
                //         arguments: mov)
                //     .then((value) {
                //   offset = 0;
                //   bloc.pushEvent(GetFavouriteMovie());
                // });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height:
                                MediaQuery.of(context).size.height * 25 / 100,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${ApiUrl.IMAGE_URL}${movie.posterPath}',
                              fit: BoxFit.cover,
                            )),
                        SizedBox(height: 4.0),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  movie.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  '${movie.releaseDate}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  'Rating : ${movie.voteAverage} from ${movie.voteCount} People Vote',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  '${movie.overview}',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
