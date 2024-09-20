import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';

part 'chat_rest_client.g.dart';

@RestApi()
abstract class ChatRestClient {
  factory ChatRestClient(Dio dio, {String baseUrl}) = _ChatRestClient;

  @POST('message')
  Future<MessageModel> postMessage(
    @Body() RequestPostMessageModel data,
  );
}
