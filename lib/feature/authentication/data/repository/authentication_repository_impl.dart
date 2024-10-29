import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/request/request_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, ResponseAuthModel>> auth(
    String id,
    String password,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.auth(
        id,
        password,
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
  Future<Either<ServerFailure, ResponseSignUpModel>> signUp(
    RequestSignUpModel request,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.signUp(
        request,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.response?.data['message'],
        ),
      );
    }
  }
}
