import 'package:dio/dio.dart';
import 'package:movieapp/bloc_dependency_injection/core/error/error_result.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/base_remote.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/feature/detail_page/data/remote/review_response.dart';

class DetailRemoteSource extends BaseRemote {
  DetailRemoteSource(Dio dio) : super(dio);
  Future<Result<ReviewResponse>> fetchReview(int page, int movie_id) async {
    String url =
        "${ApiUrl.REVIEW_MOVIE}/$movie_id/reviews?api_key=${ApiUrl.TOKEN}&language=en-US&page=$page";
    final result = await getMethod(url,
        converter: (response) => ReviewResponse.fromJson(response));
    return result;
  }
}
