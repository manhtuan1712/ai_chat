import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_image_loading_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_require_login_widget.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/helpers/event_bus.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/page/chat_detail_screen.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/widget/empty_chat_list_widget.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatHistoryModel> _chatHistoryList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ChatListCubit chatListCubit = context.read<ChatListCubit>();
        Future.delayed(
          const Duration(
            milliseconds: 200,
          ),
          () {
            if (AppUtils.isLogin) {
              chatListCubit.getChatHistoryAction();
              eventBus.on<RefreshChatListEvent>().listen(
                (event) {
                  chatListCubit.getChatHistoryAction();
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).chatTitle,
          style: AppConstants.textHeadingH5.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: context.watch<AppProvider>().accessToken.isEmpty
          ? const BaseRequireLoginWidget()
          : BlocListener<ChatListCubit, ChatListState>(
              listener: (context, state) {
                if (state is GetChatHistorySuccessState) {
                  _chatHistoryList.clear();
                  _chatHistoryList.addAll(
                    state.messages,
                  );
                  setState(() {});
                }
              },
              child: _chatHistoryList.isNotEmpty
                  ? RefreshIndicator(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => _itemHistory(
                          _chatHistoryList[index],
                        ),
                        separatorBuilder: (context, index) => Divider(
                          height: 1.0,
                          color: AppColors.light.colorGrey30,
                        ),
                        itemCount: _chatHistoryList.length,
                      ),
                      onRefresh: () async =>
                          context.read<ChatListCubit>().getChatHistoryAction(),
                    )
                  : const EmptyChatListWidget(),
            ),
    );
  }

  Widget _itemHistory(ChatHistoryModel chatHistoryModel) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => NavigationCenter.goToScreen(
        AppUtils.contextMain,
        NavigationCenter.chatDetailScreen,
        BlocProvider(
          create: (_) => sl<ChatDetailCubit>(),
          child: ChatDetailScreen(
            data: chatHistoryModel,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                60.0,
              ),
              child: CachedNetworkImage(
                imageUrl: chatHistoryModel.photo ?? '',
                errorWidget: (context, url, error) => Image.asset(
                  AppConstants.icHolderList,
                ),
                placeholder: (context, url) => const BaseImageLoadingWidget(),
                width: 60.0,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatHistoryModel.name ?? '',
                    style: AppConstants.textBody2SemiBold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    chatHistoryModel.lastMessage ?? '',
                    style: AppConstants.textBody2Regular.copyWith(
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
