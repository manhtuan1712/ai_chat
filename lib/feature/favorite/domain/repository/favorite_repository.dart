import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

abstract class FavoriteRepository {
  Future<Either<ServerFailure, List<AIAgentModel>>> getFavorites(
    Map<String, dynamic> queries,
  );

  Future<Either<ServerFailure, String>> addFavorite(
    String agentId,
  );

  Future<Either<ServerFailure, String>> removeFavorite(
    String agentId,
  );
}
