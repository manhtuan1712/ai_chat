import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/dio_logging_interceptor.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_client.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';

class BaseRestService {
  Dio? _dio;

  BaseRestClient? _baseRestClient;

  BaseRestService() {
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(
        milliseconds: GlobalConfig.receiveTimeout,
      ),
      connectTimeout: const Duration(
        milliseconds: GlobalConfig.connectTimeOut,
      ),
    );
    _dio = Dio(options);
    _dio!.interceptors.add(
      DioLoggingInterceptor(),
    );
    _baseRestClient = BaseRestClient(
      _dio!,
      baseUrl: GlobalConfig.baseUrl,
    );
  }
}
