import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class GetVoice implements UseCase<List<int>, NoParams> {
  final ChatRepository chatRepository;

  GetVoice({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, List<int>>> call(
    NoParams params,
  ) async =>
      await chatRepository.getVoice();
}
