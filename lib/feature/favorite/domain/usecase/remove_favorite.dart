import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/repository/favorite_repository.dart';

class RemoveFavorite implements UseCase<String, AddFavoriteParam> {
  final FavoriteRepository favoriteRepository;

  RemoveFavorite({
    required this.favoriteRepository,
  });

  @override
  Future<Either<ServerFailure, String>> call(
    AddFavoriteParam params,
  ) async =>
      await favoriteRepository.removeFavorite(
        params.agentId,
      );
}
