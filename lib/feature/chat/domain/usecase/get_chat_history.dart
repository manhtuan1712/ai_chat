import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class GetChatHistory implements UseCase<List<ChatHistoryModel>, NoParams> {
  final ChatRepository chatRepository;

  GetChatHistory({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, List<ChatHistoryModel>>> call(
    NoParams params,
  ) async =>
      await chatRepository.getChatHistory();
}
