import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/enums.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';

class MessageListWidget extends StatelessWidget {
  final List<MessageModel> messages;

  final ScrollController scrollController;

  const MessageListWidget({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(
        16.0,
      ),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) => _itemMessage(
        context,
        messages[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 12.0,
      ),
      itemCount: messages.length,
    );
  }

  Widget _itemMessage(
    BuildContext context,
    MessageModel message,
  ) {
    return Column(
      children: [
        Visibility(
          visible: message.query?.isNotEmpty ?? false,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 12.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BubbleSpecialOne(
                  text: message.query ?? '',
                  isSender: true,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  textStyle: AppConstants.textBody1Regular.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      40.0,
                    ),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '👤',
                    style: AppConstants.textButtonLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    40.0,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                alignment: Alignment.center,
                child: Text(
                  '🤖',
                  style: AppConstants.textButtonLarge,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              message.status == MessagingStatus.loading.get()
                  ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                      margin: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 10.0,
                      ),
                      child: SpinKitThreeBounce(
                        color: Theme.of(context).colorScheme.primary,
                        size: 24.0,
                      ),
                    )
                  : BubbleSpecialOne(
                      text: message.answer ?? '',
                      isSender: false,
                      color: Theme.of(context).colorScheme.secondary,
                      textStyle: AppConstants.textBody1Regular.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
