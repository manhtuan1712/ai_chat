import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class PostMessage implements UseCase<MessageModel, PostMessageParams> {
  final ChatRepository chatRepository;

  PostMessage({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, MessageModel>> call(
    PostMessageParams params,
  ) async =>
      await chatRepository.postMessage(
        params.requestPostMessageModel,
      );
}
