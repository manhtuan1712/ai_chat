import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shuei_ai_chat/core/base/widget/base_image_loading_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/enums.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';

class MessageListWidget extends StatelessWidget {
  final List<MessageModel> messages;

  final ScrollController scrollController;

  final String agentPhoto;

  const MessageListWidget({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.agentPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      reverse: true,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: message.type == MessageType.userMessage.get()
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            message.type == MessageType.aiAgentMessage.get()
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                      40.0,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: agentPhoto,
                      errorWidget: (context, url, error) => Image.asset(
                        AppConstants.icHolderList,
                      ),
                      placeholder: (context, url) =>
                          const BaseImageLoadingWidget(),
                      width: 40.0,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                : const SizedBox(),
            message.status == MessagingStatus.loading.get() &&
                    message.type == MessageType.aiAgentMessage.get()
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.light.colorBrandBlue10,
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
                      color: AppColors.light.colorBrandBlue,
                      size: 24.0,
                    ),
                  )
                : BubbleSpecialOne(
                    text: message.messageFormat,
                    isSender: message.type == MessageType.userMessage.get(),
                    color: message.type == MessageType.aiAgentMessage.get()
                        ? AppColors.light.colorBrandBlue10
                        : AppColors.light.colorBackgroundSecondary,
                    textStyle: AppConstants.textBody1Regular.copyWith(
                      color: AppColors.light.colorTextLink,
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
