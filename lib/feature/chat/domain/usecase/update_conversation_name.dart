import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class UpdateConversationName
    implements UseCase<ConversationModel, UpdateConversationNameParams> {
  final ChatRepository chatRepository;

  UpdateConversationName({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, ConversationModel>> call(
    UpdateConversationNameParams params,
  ) async =>
      await chatRepository.updateConversationName(
        params.conversationId,
      );
}
