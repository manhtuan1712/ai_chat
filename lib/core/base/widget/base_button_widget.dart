import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';

enum ButtonState {
  normal,
  disabled,
  error,
}

class BaseButtonWidget extends StatelessWidget {
  final Function onClick;

  final String text;

  final ButtonState buttonState;

  const BaseButtonWidget({
    super.key,
    required this.text,
    required this.onClick,
    this.buttonState = ButtonState.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonState != ButtonState.disabled ? onClick() : null,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 48.0,
        decoration: BoxDecoration(
          color: buttonState == ButtonState.normal
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            8.0,
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
