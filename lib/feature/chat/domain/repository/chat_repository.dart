import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';

abstract class ChatRepository {
  Future<Either<ServerFailure, List<ParameterSelectModel>>> getParameters();

  Future<Either<ServerFailure, List<ConversationModel>>> getConversations();

  Future<Either<ServerFailure, Stream<String>>> initChatStream(
    Map<String, dynamic> data,
  );

  Future<Either<ServerFailure, ConversationModel>> updateConversationName(
    String conversationId,
  );

  Future<Either<ServerFailure, List<MessageModel>>> getMessages(
    String conversationId,
  );

  Future<Either<ServerFailure, ConversationModel>> renameConversation(
    String conversationId,
    String name,
  );

  Future<Either<ServerFailure, MessageModel>> postMessage(
    RequestPostMessageModel requestPostMessageModel,
  );
}
