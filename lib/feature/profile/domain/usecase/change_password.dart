import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_change_password_model.dart';
import 'package:shuei_ai_chat/feature/profile/domain/repository/profile_repository.dart';

class ChangePassword
    implements UseCase<ResponseSignUpModel, ChangePasswordParams> {
  final ProfileRepository profileRepository;

  ChangePassword({
    required this.profileRepository,
  });

  @override
  Future<Either<ServerFailure, ResponseSignUpModel>> call(
    ChangePasswordParams params,
  ) async =>
      await profileRepository.changePassword(
        RequestChangePasswordModel(
          oldPassword: params.password,
          newPassword: params.newPassword,
        ),
      );
}
