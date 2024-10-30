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
