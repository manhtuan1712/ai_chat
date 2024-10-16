import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';

enum ButtonState {
  normal,
  disabled,
  error,
}

class BaseButtonWidget extends StatelessWidget {
  final Function onClick;

  final String text;

  final ButtonState buttonState;

  final double? width;

  final double? height;

  const BaseButtonWidget({
    super.key,
    required this.text,
    required this.onClick,
    this.width,
    this.height,
    this.buttonState = ButtonState.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonState != ButtonState.disabled ? onClick() : null,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width,
        height: height ?? 48.0,
        decoration: BoxDecoration(
          color: buttonState == ButtonState.normal
              ? AppColors.light.colorBrandBlue
              : AppColors.light.colorBrandBlue10,
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppConstants.textButtonMedium.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
