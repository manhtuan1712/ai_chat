import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/request/request_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_change_password_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/response/response_update_profile_model.dart';

part 'base_rest_client.g.dart';

@RestApi()
abstract class BaseRestClient {
  factory BaseRestClient(Dio dio, {String baseUrl}) = _BaseRestClient;

  @GET('recommend/agent')
  Future<List<AIAgentModel>> getRecommendAgent();

  @POST('auth')
  Future<ResponseAuthModel> auth(
    @Body() Map<String, dynamic> data,
  );

  @POST('register/user')
  Future<ResponseSignUpModel> signUp(
    @Body() RequestSignUpModel request,
  );

  @PUT('changepass/user')
  Future<ResponseSignUpModel> changePassword(
    @Body() RequestChangePasswordModel request,
  );

  @GET('v2/chat/history')
  Future<List<ChatHistoryModel>> getChatHistory();

  @GET('v2/chat/history/{agentId}')
  Future<List<MessageModel>> getAgentChatHistory(
    @Path() String agentId,
  );

  @POST('v2/chat')
  Future<MessageModel> sendMessage(
    @Body() RequestPostMessageModel request,
  );

  @POST('v2/chat/voice')
  Future<MessageModel> sendVoiceMessage(
    @Body() RequestPostMessageModel request,
  );

  @GET('user/like')
  Future<List<AIAgentModel>> getFavorites();

  @PUT('user/like')
  Future<void> addFavorite(
    @Body() Map<String, dynamic> data,
  );

  @DELETE('user/like/{agentId}')
  Future<void> removeFavorite(
    @Path() String agentId,
  );

  @GET('getprofile/user')
  Future<RequestUpdateProfileModel> getProfile();

  @PUT('updateprofile/user')
  Future<ResponseUpdateProfileModel> updateProfile(
    @Body() RequestUpdateProfileModel request,
  );
}
