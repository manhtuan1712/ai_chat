import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_require_login_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';
import 'package:shuei_ai_chat/feature/profile/presentation/widget/update_profile_widget.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemProfile(
                    Icons.info,
                    S.of(context).accountInformation,
                    () => showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: true,
                      backgroundColor: Colors.white,
                      context: AppUtils.contextMain,
                      builder: (contextDialog) {
                        return const FractionallySizedBox(
                          heightFactor: .95,
                          child: UpdateProfileWidget(),
                        );
                      },
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1.0,
                  ),
                  _itemProfile(
                    Icons.update,
                    S.of(context).changePassword,
                    () => {},
                  ),
                ],
              ),
            )
          : const BaseRequireLoginWidget(),
    );
  }

  Widget _itemProfile(
    IconData icon,
    String name,
    Function onClick,
  ) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onClick(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                name,
                style: AppConstants.textHeadingH5.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
}
