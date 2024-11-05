import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/dio_logging_interceptor.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_client.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/request/request_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_change_password_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/response/response_update_profile_model.dart';

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

  Future<List<AIAgentModel>> getRecommendAgent(
    Map<String, dynamic> queries,
  ) async {
    return _baseRestClient!.getRecommendAgent(
      queries,
    );
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

  Future<ResponseSignUpModel> signUp(
    RequestSignUpModel request,
  ) async {
    return _baseRestClient!.signUp(
      request,
    );
  }

  Future<ResponseSignUpModel> changePassword(
    RequestChangePasswordModel request,
  ) async {
    return _baseRestClient!.changePassword(
      request,
    );
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

  Future<RequestUpdateProfileModel> getProfile() async {
    return _baseRestClient!.getProfile();
  }

  Future<ResponseUpdateProfileModel> updateProfile(
    RequestUpdateProfileModel request,
  ) async {
    return _baseRestClient!.updateProfile(
      request,
    );
  }

  Future<List<AttributeFilterModel>> getListOccupation() async {
    return _baseRestClient!.getListOccupation();
  }

  Future<List<AttributeFilterModel>> getListHobbies() async {
    return _baseRestClient!.getListHobbies();
  }

  Future<List<AttributeFilterModel>> getListGenders() async {
    return _baseRestClient!.getListGenders();
  }

  Future<List<AttributeAgeFilterModel>> getListAges() async {
    return _baseRestClient!.getListAges();
  }
}
