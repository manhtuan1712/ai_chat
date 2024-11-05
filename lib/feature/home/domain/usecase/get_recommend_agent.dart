import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/domain/repository/home_repository.dart';

class GetRecommendAgent
    implements UseCase<List<AIAgentModel>, HomeFilterParam> {
  final HomeRepository homeRepository;

  GetRecommendAgent({
    required this.homeRepository,
  });

  @override
  Future<Either<ServerFailure, List<AIAgentModel>>> call(
    HomeFilterParam params,
  ) async =>
      await homeRepository.getRecommendAgent(
        params.queries,
      );
}
