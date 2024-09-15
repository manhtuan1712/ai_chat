import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class EditConversationNameDialogWidget extends StatefulWidget {
  final String name;

  final Function(String name) onEdit;

  const EditConversationNameDialogWidget({
    super.key,
    required this.name,
    required this.onEdit,
  });

  @override
  EditConversationNameDialogWidgetState createState() =>
      EditConversationNameDialogWidgetState();
}

class EditConversationNameDialogWidgetState
    extends State<EditConversationNameDialogWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).changeConversationName,
        style: AppConstants.textHeadingH5.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        height: MediaQuery.sizeOf(context).height * 0.1,
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: BaseTextFieldWidget(
          textEditingController: _controller,
          height: 45.0,
          background: Theme.of(context).colorScheme.scrim,
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          colorText: Theme.of(context).colorScheme.surfaceDim,
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
      actions: [
        BaseButtonWidget(
          text: S.of(context).ok,
          buttonState: ButtonState.normal,
          onClick: () => widget.onEdit(
            _controller.text,
          ),
        ),
      ],
    );
  }
}
