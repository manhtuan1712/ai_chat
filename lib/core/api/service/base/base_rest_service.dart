import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/dio_logging_interceptor.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_client.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

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

  Future<List<AIAgentModel>> getRecommendAgent() async {
    return _baseRestClient!.getRecommendAgent();
  }

  Future<ResponseAuthModel> auth(
    String id,
    String password,
  ) async {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['password'] = password;
    return _baseRestClient!.auth(data);
  }

  Future<List<ChatHistoryModel>> getChatHistory() async {
    return _baseRestClient!.getChatHistory();
  }

  Future<List<MessageModel>> getAgentChatHistory(
    String agentId,
  ) async {
    return _baseRestClient!.getAgentChatHistory(
      agentId,
    );
  }

  Future<MessageModel> sendMessage(
    RequestPostMessageModel request,
  ) async {
    return _baseRestClient!.sendMessage(
      request,
    );
  }

  Future<MessageModel> sendVoiceMessage(
    RequestPostMessageModel request,
  ) async {
    return _baseRestClient!.sendVoiceMessage(
      request,
    );
  }

  Future<List<AIAgentModel>> getFavorites() async {
    return _baseRestClient!.getFavorites();
  }

  Future<void> addFavorite(
    String agentId,
  ) async {
    Map<String, dynamic> data = {};
    data['agentId'] = agentId;
    return _baseRestClient!.addFavorite(
      data,
    );
  }

  Future<void> removeFavorite(
    String agentId,
  ) async {
    return _baseRestClient!.removeFavorite(
      agentId,
    );
  }
}
