import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/dio_model.dart';
import 'package:movieapp/bloc_dependency_injection/core/remote/logging_interceptors.dart';

class DioModule with DioMixin implements Dio {
  DioModule() {
    options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(LoggingInterceptor());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}
