import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/login_cubit.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/sign_up_cubit.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/page/sign_up_screen.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:shuei_ai_chat/feature/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _email = '';

  String _password = '';

  bool _isObscurePassword = true;

  bool get _isButtonActive =>
      _email.isNotEmpty && _password.isNotEmpty && _isEmailValid();

  bool _isEmailValid() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-]+\.[a-zA-Z]+",
    ).hasMatch(_email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(
            context,
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20.0,
          ),
        ),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            context.read<ChatListCubit>().getChatHistoryAction();
            context.read<FavoriteCubit>().getFavoritesAction(
              {},
            );
            context.read<AppProvider>().clearFilter();
            context.read<HomeRecommendCubit>().getRecommendAgentAction(
              {},
            );
            Navigator.pop(
              context,
            );
          } else if (state is LoginFailureState) {
            AppUtils.showToastMessage(
              state.message,
              context,
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(
            32.0,
          ),
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppConstants.icLogo(
                      context,
                    ),
                    width: MediaQuery.sizeOf(context).width * .4,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).loginEmail,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  alert: !_isEmailValid() && _email.isNotEmpty,
                  alertMessage: S.of(context).signUpEmailWrongFormat,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).loginPassword,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  obscureText: _isObscurePassword,
                  suffix: Icon(
                    _isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTapSuffix: () => setState(
                    () {
                      _isObscurePassword = !_isObscurePassword;
                    },
                  ),
                  rightPosition: 16.0,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 12.0,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => NavigationCenter.goToScreen(
                    context,
                    NavigationCenter.signUpScreen,
                    BlocProvider(
                      create: (_) => sl<SignUpCubit>(),
                      child: const SignUpScreen(),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).doNotHaveAccount,
                      style: AppConstants.textBody2SemiBold.copyWith(
                        color: AppColors.light.colorBrandBlue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                BaseButtonWidget(
                  text: S.of(context).loginToYourAccount,
                  buttonState: _isButtonActive
                      ? ButtonState.normal
                      : ButtonState.disabled,
                  onClick: () => context.read<LoginCubit>().auth(
                        _email,
                        _password,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
