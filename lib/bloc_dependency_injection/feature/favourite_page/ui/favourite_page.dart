import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/ui/widget/list_movie.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePage createState() => _FavouritePage();
}

class _FavouritePage extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourite Movie'),
      ),
      body: Container(
        child: ListFavouriteMovie(),
        // child: StreamBuilder<HomeState>(
        //     stream: bloc.stateStream,
        //     initialData: LoadingState(),
        //     builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
      ),
    );
  }
}
