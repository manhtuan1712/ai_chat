import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class SendMessage implements UseCase<MessageModel, SendMessageParams> {
  final ChatRepository chatRepository;

  SendMessage({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, MessageModel>> call(
    SendMessageParams params,
  ) async =>
      await chatRepository.sendMessage(
        RequestPostMessageModel(
          query: params.query,
          agentId: params.agentId,
          lang: params.lang,
        ),
      );
}
