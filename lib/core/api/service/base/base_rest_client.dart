import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/response_parameter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

part 'base_rest_client.g.dart';

@RestApi()
abstract class BaseRestClient {
  factory BaseRestClient(Dio dio, {String baseUrl}) = _BaseRestClient;

  @GET('parameters')
  Future<ResponseParameterModel> getParameters();

  @GET('conversations')
  Future<ResponseConversationModel> getConversations(
    @Queries() Map<String, dynamic> queries,
  );

  @POST('conversations/{conversationId}/name')
  Future<ConversationModel> updateConversationName(
    @Path('conversationId') String conversationId,
    @Body() Map<String, dynamic> body,
  );

  @GET('messages')
  Future<ResponseMessageModel> getMessages(
    @Queries() Map<String, dynamic> queries,
  );

  @POST('conversations/{conversationId}/name')
  Future<ConversationModel> renameConversation(
    @Path('conversationId') String conversationId,
    @Body() Map<String, dynamic> queries,
  );

  @GET('recommend/agent')
  Future<List<AIAgentModel>> getRecommendAgent();
}
