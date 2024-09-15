import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class GetMessages
    implements UseCase<List<MessageModel>, UpdateConversationNameParams> {
  final ChatRepository chatRepository;

  GetMessages({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, List<MessageModel>>> call(
    UpdateConversationNameParams params,
  ) async =>
      await chatRepository.getMessages(
        params.conversationId,
      );
}
