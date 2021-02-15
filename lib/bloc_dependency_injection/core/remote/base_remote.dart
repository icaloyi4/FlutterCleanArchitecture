import 'package:dio/dio.dart';
import 'package:movieapp/bloc_dependency_injection/core/error/error_result.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/safe_call_api.dart';

abstract class BaseRemote {
  final Dio _dio;
  BaseRemote(this._dio);
  Future<Result<T>> getMethod<T>(
    String endpoint, {
    Map<String, String> headers,
    ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response =
        await safeCallApi(_dio.get(endpoint, options: opsi), converter);
    return response;
  }
}
