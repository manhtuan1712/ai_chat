import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/change_password.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ChangePassword changePassword;

  ProfileCubit({
    required this.changePassword,
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
}
