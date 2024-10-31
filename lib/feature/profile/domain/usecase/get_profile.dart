import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/domain/repository/profile_repository.dart';

class GetProfile implements UseCase<RequestUpdateProfileModel, NoParams> {
  final ProfileRepository profileRepository;

  GetProfile({
    required this.profileRepository,
  });

  @override
  Future<Either<ServerFailure, RequestUpdateProfileModel>> call(
    NoParams params,
  ) async =>
      await profileRepository.getProfile();
}
