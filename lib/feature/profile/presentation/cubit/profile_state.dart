part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ChangePasswordSuccessState extends ProfileState {
  final String? message;

  ChangePasswordSuccessState({
    this.message,
  });
}

class ChangePasswordFailureState extends ProfileState {
  final String? error;

  ChangePasswordFailureState({
    this.error,
  });
}

class GetProfileSuccessState extends ProfileState {
  final RequestUpdateProfileModel? updateProfileModel;

  GetProfileSuccessState({
    this.updateProfileModel,
  });
}

class GetProfileFailureState extends ProfileState {
  final String? error;

  GetProfileFailureState({
    this.error,
  });
}

class UpdateProfileSuccessState extends ProfileState {
  final String? message;

  final RequestUpdateProfileModel? updateProfileModel;

  UpdateProfileSuccessState({
    this.message,
    this.updateProfileModel,
  });
}

class UpdateProfileFailureState extends ProfileState {
  final String? error;

  UpdateProfileFailureState({
    this.error,
  });
}
