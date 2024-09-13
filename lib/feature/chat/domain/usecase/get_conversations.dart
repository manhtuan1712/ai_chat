import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class GetConversations implements UseCase<List<ConversationModel>, NoParams> {
  final ChatRepository chatRepository;

  GetConversations({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, List<ConversationModel>>> call(
    NoParams params,
  ) async =>
      await chatRepository.getConversations();
}
