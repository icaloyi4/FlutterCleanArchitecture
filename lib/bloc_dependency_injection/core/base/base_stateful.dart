import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/base_bloc.dart';
import 'package:movieapp/bloc_dependency_injection/core/base/bloc_state.dart';

abstract class BaseState<B extends BaseBloc, BS extends BlocState,
    S extends StatefulWidget> extends State<S> {
  B bloc;

  B initBloc();
  Widget mapStateHandler(BS state);

  @override
  void initState() {
    bloc = initBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void setLog(String message) {
    print(message);
  }

  void showToast(String message,
      {Color textColor = Colors.black, Color backgroundColor = Colors.white}) {
    Fluttertoast.showToast(
        msg: message, textColor: textColor, backgroundColor: backgroundColor);
  }

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance.addPostFrameCallback(frameCallback);
  }
}
