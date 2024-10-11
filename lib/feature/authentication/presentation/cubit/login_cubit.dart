import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/usecase/post_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final PostAuth postAuth;

  LoginCubit({
    required this.postAuth,
  }) : super(LoginInitialState());

  Future<void> auth(
    String id,
    String password,
  ) async {
    emit(LoginLoadingState());
    final failureOrLogin = await postAuth(
      AuthParams(
        id: id,
        password: password,
      ),
    );
    failureOrLogin.fold(
      (failure) => emit(
        LoginFailureState(
          message: failure.mess ?? '',
        ),
      ),
      (user) => emit(
        LoginSuccessState(),
      ),
    );
  }
}
