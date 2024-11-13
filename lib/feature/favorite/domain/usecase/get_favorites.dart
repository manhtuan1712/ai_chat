import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

class GetFavorites implements UseCase<List<AIAgentModel>, HomeFilterParam> {
  final FavoriteRepository favoriteRepository;

  GetFavorites({
    required this.favoriteRepository,
  });

  @override
  Future<Either<ServerFailure, List<AIAgentModel>>> call(
    HomeFilterParam homeFilterParam,
  ) async =>
      await favoriteRepository.getFavorites(
        homeFilterParam.queries,
      );
}
