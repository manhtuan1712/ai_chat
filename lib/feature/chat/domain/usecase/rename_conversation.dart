import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class RenameConversation
    implements UseCase<ConversationModel, RenameConversationNameParams> {
  final ChatRepository chatRepository;

  RenameConversation({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, ConversationModel>> call(
    RenameConversationNameParams params,
  ) async =>
      await chatRepository.renameConversation(
        params.conversationId,
        params.name,
      );
}
