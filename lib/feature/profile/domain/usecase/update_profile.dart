import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/response/response_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/domain/repository/profile_repository.dart';

class UpdateProfile
    implements UseCase<ResponseUpdateProfileModel, UpdateProfileParams> {
  final ProfileRepository profileRepository;

  UpdateProfile({
    required this.profileRepository,
  });

  @override
  Future<Either<ServerFailure, ResponseUpdateProfileModel>> call(
    UpdateProfileParams params,
  ) async =>
      await profileRepository.updateProfile(
        RequestUpdateProfileModel(
          name: params.name,
          age: params.age,
          location: params.location,
          hobbies: params.hobbies,
          description: params.description,
        ),
      );
}
