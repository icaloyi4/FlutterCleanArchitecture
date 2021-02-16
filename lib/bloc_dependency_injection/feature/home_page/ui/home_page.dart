import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/ui/widget/card_banner_widget.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/ui/widget/card_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext _context;
  List<Movie> nowPlaying = [];
  List<Movie> popular = [];

  @override
  void initState() {
    super.initState();
    // bloc.pushEvent(GetDiscoverMovieEvent(page: 1));
    // bloc.pushEvent(GetPopularMovieEvent(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            tooltip: "Save Todo and Retrun to List",
            onPressed: () {
              // save();
            },
          )
        ],
      ),
      body: Container(
        child: _home(),
        // child: StreamBuilder<HomeState>(
        //     stream: bloc.stateStream,
        //     initialData: LoadingState(),
        //     builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
      ),
    );
  }

  Widget _home() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft, child: Text("Now Playing")),
          ),
          CardBannerWidget(
              height: MediaQuery.of(_context).size.height * 30 / 100,
              widht: MediaQuery.of(_context).size.width * 80 / 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft, child: Text("Popular Movie")),
          ),
          CardListWidget(
              height: MediaQuery.of(_context).size.height * 27.5 / 100,
              widht: MediaQuery.of(_context).size.width * 30 / 100,
              type: 'popular'),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Align(alignment: Alignment.centerLeft, child: Text("Upcoming")),
          ),
          CardListWidget(
              height: MediaQuery.of(_context).size.height * 27.5 / 100,
              widht: MediaQuery.of(_context).size.width * 30 / 100,
              type: 'upcoming'),
          // CardListWidget(
          //     height: MediaQuery.of(_context).size.height * 20 / 100,
          //     widht: MediaQuery.of(_context).size.width * 20 / 100,
          //     movie: nowPlaying),
        ],
      ),
    );
  }
}
