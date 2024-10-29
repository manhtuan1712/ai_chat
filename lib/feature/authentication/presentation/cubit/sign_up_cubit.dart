import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/usecase/post_sign_up.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final PostSignUp postSignUp;

  SignUpCubit({
    required this.postSignUp,
  }) : super(SignUpInitialState());

  Future<void> signUp(
    String id,
    String name,
    String password,
  ) async {
    emit(SignUpLoadingState());
    final failureOrSignUp = await postSignUp(
      SignUpParams(
        id: id,
        password: password,
        name: name,
      ),
    );
    failureOrSignUp.fold(
      (failure) => emit(
        SignUpFailureState(
          message: failure.mess ?? '',
        ),
      ),
      (user) => emit(
        SignUpSuccessState(),
      ),
    );
  }
}
