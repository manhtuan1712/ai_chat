import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/api/dio_logging_interceptor.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_client.dart';
import 'package:shuei_ai_chat/core/api/service/base/chat_rest_client.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_parameter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

class BaseRestService {
  Dio? _dio;

  BaseRestClient? _baseRestClient;

  ChatRestClient? _chatRestClient;

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
    _chatRestClient = ChatRestClient(
      _dio!,
      baseUrl: GlobalConfig.chatUrl,
    );
  }

  Future<ResponseParameterModel> getParameters() async {
    return _baseRestClient!.getParameters();
  }

  Future<ResponseConversationModel> getConversations() async {
    Map<String, dynamic> data = {};
    AppProvider appProvider = AppUtils.contextMain.read<AppProvider>();
    data['limit'] = 100;
    data['pinned'] = false;
    await appProvider.getUser();
    data['user'] = appProvider.user;
    return _baseRestClient!.getConversations(
      data,
    );
  }

  Future<ConversationModel> updateConversationName(
    String conversationId,
  ) async {
    Map<String, dynamic> data = {};
    AppProvider appProvider = AppUtils.contextMain.read<AppProvider>();
    data['user'] = appProvider.user;
    data['auto_generate'] = true;
    return _baseRestClient!.updateConversationName(
      conversationId,
      data,
    );
  }

  Future<ResponseMessageModel> getMessages(
    String conversationId,
  ) async {
    Map<String, dynamic> data = {};
    AppProvider appProvider = AppUtils.contextMain.read<AppProvider>();
    data['limit'] = 50;
    data['conversation_id'] = conversationId;
    data['user'] = appProvider.user;
    return _baseRestClient!.getMessages(
      data,
    );
  }

  Future<ConversationModel> renameConversation(
    String conversationId,
    String name,
  ) async {
    Map<String, dynamic> data = {};
    AppProvider appProvider = AppUtils.contextMain.read<AppProvider>();
    data['name'] = name;
    data['user'] = appProvider.user;
    return _baseRestClient!.renameConversation(
      conversationId,
      data,
    );
  }

  Future<MessageModel> postMessage(RequestPostMessageModel request) async {
    AppProvider appProvider = AppUtils.contextMain.read<AppProvider>();
    await appProvider.getUser();
    request.user = appProvider.user;
    return _chatRestClient!.postMessage(
      request,
    );
  }

  Future<List<AIAgentModel>> getRecommendAgent() async {
    return _baseRestClient!.getRecommendAgent();
  }
}
