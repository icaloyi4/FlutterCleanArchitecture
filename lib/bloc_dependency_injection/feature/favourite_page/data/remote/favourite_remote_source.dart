import 'package:dio/dio.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/base_remote.dart';

class FavouriteRemoteSource extends BaseRemote {
  FavouriteRemoteSource(Dio dio) : super(dio);
}
