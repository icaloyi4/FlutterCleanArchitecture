import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeBloc, HomeState, HomeScreen> {
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
  Widget mapStateHandler(HomeState state) {
    if (state is SuccessGetDiscoverState && state.movieList.isNotEmpty) {
      return _moviesCard(state.movieList);
    } else if (state is FailedGetDiscoverState) {
      if (state.movieList.isEmpty) {
        return _errorText(state.message);
      } else {
        showToast(state.message);
        return _moviesCard(state.movieList);
      }
    } else {
      return _loadingView(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Container(
        child: StreamBuilder<HomeState>(
            stream: bloc.stateStream,
            initialData: LoadingState(),
            builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
      ),
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

  Widget _moviesCard(List<Movie> movies) {
    Size _size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: movies.length ?? 0,
        itemBuilder: (ctx, pos) {
          Movie movie = movies[pos];
          return Padding(
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, Routing.DETAIL_MOVIE,
              //       arguments: movie);
              // },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: _size.width,
                        height: 200,
                        child: CachedNetworkImage(
                          imageUrl: '${ApiUrl.IMAGE_URL}${movie.backdropPath}',
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
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _errorText(String message) {
    return Center(
      child: Text(message),
    );
  }
}
