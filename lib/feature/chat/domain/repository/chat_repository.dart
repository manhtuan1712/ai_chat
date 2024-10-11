import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';

abstract class ChatRepository {
  Future<Either<ServerFailure, List<ChatHistoryModel>>> getChatHistory();

  Future<Either<ServerFailure, List<MessageModel>>> getAgentChatHistory(
    String agentId,
  );

  Future<Either<ServerFailure, MessageModel>> sendMessage(
    RequestPostMessageModel request,
  );
}
