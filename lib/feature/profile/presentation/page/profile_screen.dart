import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_require_login_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).profileTitle,
          style: AppConstants.textHeadingH5.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: context.watch<AppProvider>().user.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: BaseButtonWidget(
            text: S.of(context).logOut,
            onClick: () {
              AppUtils.logOut();
              context.read<HomeRecommendCubit>().getRecommendAgentAction();
            },
            buttonState: ButtonState.normal,
          ),
        ),
      ),
      body: AppUtils.isLogin
          ? Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.light.colorBrandBlue.withOpacity(
                        0.1,
                      ),
                      borderRadius: BorderRadius.circular(
                        40.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(
                      6.0,
                    ),
                    child: Icon(
                      Icons.person,
                      color: AppColors.light.colorBrandBlue,
                      size: 50.0,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    context.watch<AppProvider>().user,
                    style: AppConstants.textButtonLarge.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          : const BaseRequireLoginWidget(),
    );
  }
}
