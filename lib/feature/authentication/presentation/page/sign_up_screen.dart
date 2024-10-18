import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  String _email = '';

  String _userName = '';

  String _password = '';

  String _rePassword = '';

  bool _isObscurePassword = true;

  bool _isObscureRePassword = true;

  bool get _isButtonActive =>
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      _rePassword.isNotEmpty &&
      _userName.isNotEmpty &&
      _password == _rePassword &&
      _isEmailValid();

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
      body: Container(
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
                hintText: S.of(context).loginUserName,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                colorText: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _userName = value;
                  });
                },
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
                  _isObscurePassword ? Icons.visibility : Icons.visibility_off,
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
                hintText: S.of(context).loginRePassword,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                colorText: Colors.black,
                obscureText: _isObscureRePassword,
                suffix: Icon(
                  _isObscureRePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTapSuffix: () => setState(
                  () {
                    _isObscureRePassword = !_isObscureRePassword;
                  },
                ),
                rightPosition: 16.0,
                alert: _rePassword != _password,
                alertMessage: S.of(context).loginRePasswordNotMatch,
                onChanged: (value) {
                  setState(() {
                    _rePassword = value;
                  });
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              BaseButtonWidget(
                text: S.of(context).loginToYourAccount,
                buttonState:
                    _isButtonActive ? ButtonState.normal : ButtonState.disabled,
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
