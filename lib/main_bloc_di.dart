import 'package:flutter/material.dart';
import 'package:movieapp/bloc_dependency_injection/core/injection/injection.dart';

import 'bloc_dependency_injection/core/routing/router.dart';
import 'bloc_dependency_injection/core/routing/routing.dart';

void main() {
  AppModule.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Arch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouterApp.generateRoute,
      initialRoute: Routing.ROOT,
    );
  }
}
