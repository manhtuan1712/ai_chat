import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/change_password.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/get_profile.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/update_profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ChangePassword changePassword;

  GetProfile getProfile;

  UpdateProfile updateProfile;

  ProfileCubit({
    required this.changePassword,
    required this.getProfile,
    required this.updateProfile,
  }) : super(ProfileInitialState());

  Future<void> changePasswordAction(
    String oldPassword,
    String newPassword,
  ) async {
    emit(
      ProfileLoadingState(),
    );
    final result = await changePassword(
      ChangePasswordParams(
        password: oldPassword,
        newPassword: newPassword,
      ),
    );
    result.fold(
      (l) {
        emit(
          ChangePasswordFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          ChangePasswordSuccessState(),
        );
      },
    );
  }

  Future<void> getProfileAction() async {
    emit(
      ProfileLoadingState(),
    );
    final result = await getProfile(
      NoParams(),
    );
    result.fold(
      (l) {
        emit(
          GetProfileFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          GetProfileSuccessState(
            updateProfileModel: r,
          ),
        );
      },
    );
  }

  Future<void> updateProfileAction(
    String name,
    num age,
    String location,
    String hobbies,
    String description,
  ) async {
    emit(
      ProfileLoadingState(),
    );
    final result = await updateProfile(
      UpdateProfileParams(
        name: name,
        age: age,
        location: location,
        hobbies: hobbies,
        description: description,
      ),
    );
    result.fold(
      (l) {
        emit(
          UpdateProfileFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          UpdateProfileSuccessState(
            updateProfileModel: r.profile,
            message: r.message,
          ),
        );
      },
    );
  }
}
