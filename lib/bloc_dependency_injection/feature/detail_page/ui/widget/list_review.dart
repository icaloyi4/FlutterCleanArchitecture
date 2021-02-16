import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_stateful.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/database_module.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/bloc/detail_bloc.dart';

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
  Widget mapStateHandler(DetailState state) {
    // TODO: implement mapStateHandler
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return list([widget.movie, widget.movie]);
  }

  Widget list(List<Movie> _movie) {
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
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemCount: _movie.length ?? 0,
            itemBuilder: (ctx, pos) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 75,
                            height: 75,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Icon(
                              Icons.people_alt_outlined,
                              size: 75,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Author',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  'tgl komen',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
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
                    child: Text(
                        "lkay Gündoğan (German pronunciation: [ˈʔɪlkaɪ ˈɡʏndoːan], Turkish: [ˈilkaj ˈɟyndoan]; born 24 October 1990) is a German professional footballer who plays as a midfielder for Premier League club Manchester City and the Germany national team."),
                  ),
                ],
              );
            }));
  }
}
