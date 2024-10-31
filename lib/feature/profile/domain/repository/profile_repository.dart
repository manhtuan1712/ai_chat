import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_change_password_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/response/response_update_profile_model.dart';

abstract class ProfileRepository {
  Future<Either<ServerFailure, ResponseSignUpModel>> changePassword(
    RequestChangePasswordModel request,
  );

  Future<Either<ServerFailure, RequestUpdateProfileModel>> getProfile();

  Future<Either<ServerFailure, ResponseUpdateProfileModel>> updateProfile(
    RequestUpdateProfileModel request,
  );
}
