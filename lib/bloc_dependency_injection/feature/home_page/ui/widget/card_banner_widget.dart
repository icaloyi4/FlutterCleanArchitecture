import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CardBannerWidget extends StatefulWidget {
  final double height;
  final double widht;

  CardBannerWidget({@required this.height, @required this.widht});

  @override
  _CardBannerWidget createState() => _CardBannerWidget();
}

class _CardBannerWidget
    extends BaseState<HomeBloc, HomeState, CardBannerWidget> {
  int page = 1;
  ScrollController _scrollController = new ScrollController();
  @override
  HomeBloc initBloc() {
    return KiwiContainer().resolve<HomeBloc>();
  }

  @override
  void initState() {
    super.initState();
    bloc.pushEvent(GetDiscoverMovieEvent());
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
    if (state is SuccessGetDiscoverState && state.movieList.isNotEmpty) {
      return list(state.movieList);
    } else if (state is FailedGetDiscoverState) {
      if (state.movieList.isEmpty) {
        return _errorText(state.message);
      } else {
        return list(state.movieList);
      }
    } else {
      return _loadingView(context);
    }
  }

  Widget list(List<Movie> _movie) {
    double _height = widget.height;
    double _widht = widget.widht;
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        var metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          if (metrics.pixels == 0) {
            print('At top');
          } else {
            print('At bottom');
            bloc.pushEvent(LoadMoreMovieEvent(type: 'now'));
          }
          // bloc.pageDiscover++;
          // bloc.pushEvent(GetDiscoverMovieEvent());
        }
        return true;
      },
      child: ListView.builder(
          controller: _scrollController,
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: _widht * 80 / 100,
                          height: _height * 70 / 100,
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ApiUrl.IMAGE_URL}${movie.backdropPath}',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(height: 4.0),
                      Container(
                        width: _widht * 80 / 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: _widht * 50 / 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      movie.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      'Date Release: ${movie.releaseDate}',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      movie.voteAverage.toString(),
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 20),
                                    ),
                                    Text(
                                      '${movie.voteCount} People Vote',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _errorText(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _loadingView(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int item = (size.height / 156).round();
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: item,
            itemBuilder: (c, i) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 100,
                    ),
                    SizedBox(height: 12),
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
