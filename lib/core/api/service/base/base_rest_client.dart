import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

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

  @GET('chat/history')
  Future<List<ChatHistoryModel>> getChatHistory();

  @GET('chat/history/{agentId}')
  Future<List<MessageModel>> getAgentChatHistory(
    @Path() String agentId,
  );

  @POST('chat')
  Future<MessageModel> sendMessage(
    @Body() RequestPostMessageModel request,
  );

  @POST('chat/voice')
  Future<MessageModel> sendVoiceMessage(
    @Body() RequestPostMessageModel request,
  );
}
