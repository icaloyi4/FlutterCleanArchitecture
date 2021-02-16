import 'package:flutter/foundation.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_event.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_state.dart';

part 'detail_state.dart';
part 'detail_event.dart';

class DetailBloc extends BaseBloc<DetailEvent, DetailState> {
  @override
  void mapEventToState(DetailEvent event) {
    // TODO: implement mapEventToState
  }
}
