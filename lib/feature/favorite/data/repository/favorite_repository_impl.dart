import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/favorite/data/datasource/favorite_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepositoryImpl({
    required this.favoriteRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<AIAgentModel>>> getFavorites() async {
    try {
      var response = await favoriteRemoteDataSource.getFavorites();
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> addFavorite(
    String agentId,
  ) async {
    try {
      var response = await favoriteRemoteDataSource.addFavorite(
        agentId,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeFavorite(
    String agentId,
  ) async {
    try {
      var response = await favoriteRemoteDataSource.removeFavorite(
        agentId,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }
}
