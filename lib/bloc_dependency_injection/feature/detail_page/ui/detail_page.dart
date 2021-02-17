import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/entities/movies_favourite_entity.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/core/widget/shimmer_loading.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/bloc/detail_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/ui/widget/list_review.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  DetailScreen({@required this.movie});

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends BaseState<DetailBloc, DetailState, DetailScreen> {
  @override
  DetailBloc initBloc() {
    return KiwiContainer().resolve<DetailBloc>();
  }

  @override
  void initState() {
    super.initState();
    bloc.pushEvent(
        GetMovieFaovourite(widget.movie.movieId, widget.movie.typeMovie));
  }

  @override
  Widget mapStateHandler(DetailState state) {
    if (state is SuccessGetFavourite) {
      return footer(state.movie);
    } else if (state is FailedGetFavourite) {
      return footer(null);
    } else if (state is SuccessUpdateFavourite) {
      return footer(state.movie);
    } else if (state is FailedUpdateFavourite) {
      return footer(null);
    } else {
      return ShimmerLoading(type: Axis.horizontal);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 40 / 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: banner(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 52 / 100,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: body(),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 8 / 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              child: StreamBuilder<DetailState>(
                  stream: bloc.stateStream,
                  initialData: LoadingState(),
                  builder: (blocCtx, snapshot) =>
                      mapStateHandler(snapshot.data)),
            ),
          ),
        ],
      ),
    );
  }

  Widget banner() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: CachedNetworkImage(
        imageUrl: '${ApiUrl.IMAGE_URL}${widget.movie.backdropPath}',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget footer(MoviesFavouriteData moviesFavourite) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  bloc.pushEvent(UpdateFavouriteMovie(
                      (moviesFavourite == null
                          ? true
                          : (moviesFavourite.favourite ? false : true)),
                      widget.movie.movieId,
                      widget.movie.typeMovie,
                      widget.movie));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    moviesFavourite == null
                        ? Icons.favorite_outline
                        : moviesFavourite.favourite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.movie.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Date Release: ${widget.movie.releaseDate}',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    width: 1,
                    height: 50,
                    color: Colors.black38,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.movie.voteAverage.toString(),
                        style: TextStyle(color: Colors.amber, fontSize: 20),
                      ),
                      Text(
                        '${widget.movie.voteCount} People Vote',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Description',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.movie.overview,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Review',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListReview(movie: widget.movie)
        ],
      ),
    );
  }
}
