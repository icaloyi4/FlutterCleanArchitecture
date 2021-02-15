import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/undefined_view.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/ui/home_page.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.ROOT:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
