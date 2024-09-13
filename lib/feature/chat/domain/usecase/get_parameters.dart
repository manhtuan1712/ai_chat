import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class GetParameters implements UseCase<List<ParameterSelectModel>, NoParams> {
  final ChatRepository chatRepository;

  GetParameters({
    required this.chatRepository,
  });

  @override
  Future<Either<ServerFailure, List<ParameterSelectModel>>> call(
    NoParams params,
  ) async =>
      await chatRepository.getParameters();
}
