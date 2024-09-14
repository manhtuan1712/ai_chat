import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class InitChatStream implements UseCase<Stream<String>, InitChatParams> {
  final ChatRepository chatRepository;

  InitChatStream({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, Stream<String>>> call(
    InitChatParams params,
  ) async =>
      await chatRepository.initChatStream(
        params.data,
      );
}
