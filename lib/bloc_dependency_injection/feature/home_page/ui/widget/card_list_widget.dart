import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart';
import 'package:movieapp/bloc_dependency_injection/core/widget/error_text.dart';
import 'package:movieapp/bloc_dependency_injection/core/widget/shimmer_loading.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CardListWidget extends StatefulWidget {
  final double height;
  final double widht;
  final String type;

  CardListWidget(
      {@required this.height, @required this.widht, @required this.type});

  @override
  _CardListWidget createState() => _CardListWidget();
}

class _CardListWidget extends BaseState<HomeBloc, HomeState, CardListWidget> {
  @override
  HomeBloc initBloc() {
    return KiwiContainer().resolve<HomeBloc>();
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == 'popular') {
      bloc.pushEvent(GetPopularMovieEvent());
    }
    if (widget.type == 'upcoming') {
      bloc.pushEvent(GetUpcomingMovieEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: StreamBuilder<HomeState>(
          stream: bloc.stateStream,
          initialData: LoadingState(),
          builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
    );
  }

  @override
  Widget mapStateHandler(HomeState state) {
    if (state is SuccessGetPopularState && state.movieList.isNotEmpty) {
      return list(state.movieList);
    } else if (state is FailedGetPopularState) {
      if (state.movieList.isEmpty) {
        return ErrorText(message: state.message);
      } else {
        return list(state.movieList);
      }
    } else if (state is SuccessGetUpcomingState && state.movieList.isNotEmpty) {
      return list(state.movieList);
    } else if (state is FailedGetPopularState) {
      if (state.movieList.isEmpty) {
        return ErrorText(message: state.message);
      } else {
        return list(state.movieList);
      }
    } else {
      return ShimmerLoading(type: Axis.vertical);
    }
  }

  Widget list(List<Movie> _movie) {
    double _height;
    double _widht;
    _height = widget.height;
    _widht = widget.widht;
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        var metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          if (metrics.pixels == 0) {
            print('At top');
          } else {
            print('At bottom');
            if (widget.type == 'popular') {
              bloc.pushEvent(LoadMoreMovieEvent(type: 'popular'));
            }
            if (widget.type == 'upcoming') {
              bloc.pushEvent(LoadMoreMovieEvent(type: 'upcoming'));
            }
          }
          // bloc.pageDiscover++;
          // bloc.pushEvent(GetDiscoverMovieEvent());
        }
        return true;
      },
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 8),
          itemCount: _movie.length ?? 0,
          itemBuilder: (ctx, pos) {
            Movie movie = _movie[pos];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routing.DETAIL_MOVIE,
                    arguments: movie);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: _widht,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: _widht,
                            height: _height * 70 / 100,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${ApiUrl.IMAGE_URL}${movie.posterPath}',
                              fit: BoxFit.cover,
                            )),
                        SizedBox(height: 4.0),
                        Container(
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
                            ],
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

  // Widget _errorText(String message) {
  //   return Center(
  //     child: Text(message),
  //   );
  // }

  // Widget _loadingView(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   int item = (size.height / 156).round();
  //   return Container(
  //     width: size.width,
  //     height: size.height,
  //     padding: EdgeInsets.only(top: 12, left: 12, right: 12),
  //     child: Shimmer.fromColors(
  //       baseColor: Colors.grey[300],
  //       highlightColor: Colors.grey[100],
  //       enabled: true,
  //       child: ListView.builder(
  //           scrollDirection: Axis.vertical,
  //           itemCount: item,
  //           itemBuilder: (c, i) {
  //             return Container(
  //               padding: EdgeInsets.symmetric(vertical: 8),
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     color: Colors.white,
  //                     width: size.width,
  //                     height: 100,
  //                   ),
  //                   SizedBox(height: 12),
  //                   Container(
  //                     color: Colors.white,
  //                     width: size.width,
  //                     height: 20,
  //                   ),
  //                 ],
  //               ),
  //             );
  //           }),
  //     ),
  //   );
  // }
}
