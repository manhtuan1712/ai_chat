import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

abstract class HomeRepository {
  Future<Either<ServerFailure, List<AIAgentModel>>> getRecommendAgent();
}
