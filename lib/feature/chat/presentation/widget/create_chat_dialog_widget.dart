import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class CreateChatDialogWidget extends StatefulWidget {
  final List<ParameterSelectModel> parameters;

  final Function(
    Map<String, dynamic> data,
  ) callBack;

  const CreateChatDialogWidget({
    super.key,
    required this.parameters,
    required this.callBack,
  });

  @override
  CreateChatDialogWidgetState createState() => CreateChatDialogWidgetState();
}

class CreateChatDialogWidgetState extends State<CreateChatDialogWidget> {
  final Map<String, dynamic> _data = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '🤖 ${S.of(context).addNewConversationCTA}',
        style: AppConstants.textHeadingH5.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...widget.parameters.map(
            (value) => Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: DropdownButtonFormField<String>(
                items: value.select!.options!
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: AppConstants.textFootNoteRegular.copyWith(
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (text) {
                  _data[value.select!.label!] = text;
                  setState(() {});
                },
                style: AppConstants.textFootNoteRegular.copyWith(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
                hint: Text(
                  '${S.of(context).select} ${value.select!.label}',
                  style: AppConstants.textFootNoteRegular.copyWith(
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Rounded border
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  fillColor: Theme.of(context).colorScheme.secondary,
                ),
                focusColor: Colors.transparent,
                dropdownColor: Theme.of(context)
                    .colorScheme
                    .secondary, // Custom background color for dropdown
              ),
            ),
          ),
        ],
      ),
      actions: [
        BaseButtonWidget(
          text: S.of(context).startAChat,
          buttonState: _data.keys.length == 2
              ? ButtonState.normal
              : ButtonState.disabled,
          onClick: () {
            widget.callBack(
              _data,
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
