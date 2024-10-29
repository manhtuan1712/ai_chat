import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  UpdateProfileWidgetState createState() => UpdateProfileWidgetState();
}

class UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  String _nickName = '';

  String _age = '';

  String _place = '';

  String _hobbies = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
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
                hintText: S.of(context).nickName,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                colorText: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _nickName = value;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              BaseTextFieldWidget(
                height: 56.0,
                hintText: S.of(context).age,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                colorText: Colors.black,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              BaseTextFieldWidget(
                height: 56.0,
                hintText: S.of(context).place,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                colorText: Colors.black,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _place = value;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              BaseTextFieldWidget(
                height: 56.0,
                hintText: S.of(context).hobbies,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                colorText: Colors.black,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _hobbies = value;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              BaseTextFieldWidget(
                height: MediaQuery.sizeOf(context).height * .95 - 432,
                hintText: S.of(context).description,
                background: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 8.0,
                ),
                textAlignVertical: TextAlignVertical.top,
                alignment: Alignment.topLeft,
                colorText: Colors.black,
                maxLine: 10,
                onChanged: (value) {
                  setState(() {
                    _hobbies = value;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              BaseButtonWidget(
                buttonState: ButtonState.normal,
                text: S.of(context).update,
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
