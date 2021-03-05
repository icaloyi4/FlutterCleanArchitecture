import 'package:get/get.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart' as r;
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/ui/detail_page.dart';
import 'package:movieapp/bloc_dependency_injection/feature/favourite_page/ui/favourite_page.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/ui/home_page.dart';
import 'package:movieapp/bloc_dependency_injection/feature/splash_screen.dart';

class GetRouter{
  static List<GetPage> generateRoute(){
    return [
    GetPage(name: r.Routing.ROOT, page: () => SplashScreen()),
    GetPage(name: r.Routing.HOME, page: () => HomeScreen()),
    GetPage(name: r.Routing.DETAIL_MOVIE, page: () => DetailScreen()),
    GetPage(name: r.Routing.FAVOURITE_MOVIE, page: () => FavouritePage())
    ];
  }
}