import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/login_cubit.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/page/login_screen.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class BaseRequireLoginWidget extends StatelessWidget {
  const BaseRequireLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppConstants.icRetry,
            width: 200.0,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            S.of(context).pleaseLoginIn,
            textAlign: TextAlign.center,
            style: AppConstants.textHeadingH5.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          BaseButtonWidget(
            text: S.of(context).loginToYourAccount,
            buttonState: ButtonState.normal,
            onClick: () => NavigationCenter.goToScreen(
              AppUtils.contextMain,
              NavigationCenter.loginScreen,
              BlocProvider(
                create: (_) => sl<LoginCubit>(),
                child: const LoginScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
