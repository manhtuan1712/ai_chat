import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/repository/authentication_repository.dart';

class PostAuth implements UseCase<ResponseAuthModel, AuthParams> {
  final AuthenticationRepository authenticationRepository;

  PostAuth({
    required this.authenticationRepository,
  });

  @override
  Future<Either<ServerFailure, ResponseAuthModel>> call(
    AuthParams params,
  ) async =>
      await authenticationRepository.auth(
        params.id,
        params.password,
      );
}
