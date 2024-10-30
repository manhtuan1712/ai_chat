import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class UpdatePasswordWidget extends StatefulWidget {
  const UpdatePasswordWidget({super.key});

  @override
  UpdatePasswordWidgetState createState() => UpdatePasswordWidgetState();
}

class UpdatePasswordWidgetState extends State<UpdatePasswordWidget> {
  String _password = '';

  String _newPassword = '';

  String _reNewPassword = '';

  bool _isObscurePassword = true;

  bool _isObscureNewPassword = true;

  bool _isObscureReNewPassword = true;

  bool get _isButtonActive =>
      _newPassword.isNotEmpty &&
      _password.isNotEmpty &&
      _reNewPassword.isNotEmpty &&
      _newPassword == _reNewPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: BaseButtonWidget(
          buttonState:
              _isButtonActive ? ButtonState.normal : ButtonState.disabled,
          text: S.of(context).update,
          onClick: () => context.read<ProfileCubit>().changePasswordAction(
                _password,
                _newPassword,
              ),
        ),
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            AppUtils.showToastMessage(
              S.of(context).changePasswordSuccess,
              context,
            );
            Navigator.pop(context);
          } else if (state is ChangePasswordFailureState) {
            AppUtils.showToastMessage(
              state.error ?? '',
              context,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(
                      context,
                    ),
                    icon: const Icon(
                      Icons.close,
                      size: 24.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
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
                  height: 16.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).newPassword,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  obscureText: _isObscureNewPassword,
                  suffix: Icon(
                    _isObscureNewPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTapSuffix: () => setState(
                    () {
                      _isObscureNewPassword = !_isObscureNewPassword;
                    },
                  ),
                  rightPosition: 16.0,
                  onChanged: (value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).reNewPassword,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  obscureText: _isObscureReNewPassword,
                  suffix: Icon(
                    _isObscureReNewPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTapSuffix: () => setState(
                    () {
                      _isObscureReNewPassword = !_isObscureReNewPassword;
                    },
                  ),
                  rightPosition: 16.0,
                  alert: _reNewPassword != _newPassword,
                  alertMessage: S.of(context).loginRePasswordNotMatch,
                  onChanged: (value) {
                    setState(() {
                      _reNewPassword = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
