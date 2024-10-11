import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class GetAgentChatHistory
    implements UseCase<List<MessageModel>, AgentChatHistoryParams> {
  final ChatRepository chatRepository;

  GetAgentChatHistory({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, List<MessageModel>>> call(
    AgentChatHistoryParams params,
  ) async =>
      await chatRepository.getAgentChatHistory(
        params.agentId,
      );
}
