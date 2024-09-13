import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/dio_logging_interceptor.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_client.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_parameter_model.dart';

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

  Future<ResponseParameterModel> getParameters() async {
    return _baseRestClient!.getParameters();
  }

  Future<ResponseConversationModel> getConversations() async {
    Map<String, dynamic> data = {};
    data['limit'] = 100;
    data['pinned'] = false;
    return _baseRestClient!.getConversations(
      data,
    );
  }
}
