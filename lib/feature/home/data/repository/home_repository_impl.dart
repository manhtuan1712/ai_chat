import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<AIAgentModel>>> getRecommendAgent() async {
    try {
      var response = await homeRemoteDataSource.getRecommendAgent();
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
