import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/datasource/profile_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_change_password_model.dart';
import 'package:shuei_ai_chat/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, ResponseSignUpModel>> changePassword(
    RequestChangePasswordModel request,
  ) async {
    try {
      var response = await profileRemoteDataSource.changePassword(
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
