import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/request/request_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/repository/authentication_repository.dart';

class PostSignUp implements UseCase<ResponseSignUpModel, SignUpParams> {
  final AuthenticationRepository authenticationRepository;

  PostSignUp({
    required this.authenticationRepository,
  });

  @override
  Future<Either<ServerFailure, ResponseSignUpModel>> call(
    SignUpParams params,
  ) async =>
      await authenticationRepository.signUp(
        RequestSignUpModel(
          id: params.id,
          name: params.name,
          password: params.password,
        ),
      );
}
