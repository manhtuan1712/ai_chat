import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/helpers/enums.dart';
import 'package:shuei_ai_chat/core/helpers/event_bus.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/widget/message_list_widget.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/widget/speech_to_text_widget.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatHistoryModel? data;

  const ChatDetailScreen({
    super.key,
    this.data,
  });

  @override
  ChatDetailScreenState createState() => ChatDetailScreenState();
}

class ChatDetailScreenState extends State<ChatDetailScreen>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _chatController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  final List<MessageModel> _messages = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<ChatDetailCubit>().getAgentChatHistoryAction(
              widget.data?.agentId ?? '',
            );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  _sendMessageAction(
    String action,
    String value,
  ) {
    if (value.isNotEmpty) {
      _messages.add(
        MessageModel(
          type: MessageType.userMessage.get(),
          message: value,
          status: MessagingStatus.done.get(),
        ),
      );
      _messages.add(
        MessageModel(
          type: MessageType.aiAgentMessage.get(),
          message: '',
          status: MessagingStatus.loading.get(),
        ),
      );
      if (action == ChatMessageEvent.voice.get()) {
        context.read<ChatDetailCubit>().sendVoiceMessageAction(
              value,
              widget.data?.agentId ?? '',
            );
      } else {
        context.read<ChatDetailCubit>().sendMessageAction(
              value,
              widget.data?.agentId ?? '',
            );
      }
    }
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
        title: Text(
          widget.data?.name ?? '',
          style: AppConstants.textHeadingH5.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<ChatDetailCubit, ChatDetailState>(
        listener: (context, state) async {
          if (state is ChatReceivedState) {
            eventBus.fire(
              RefreshChatListEvent(),
            );
            _messages.last.message = state.messageModel.message;
            _messages.last.status = MessagingStatus.done.get();
            setState(() {});
          } else if (state is GetMessageSuccessState) {
            _messages.clear();
            _messages.addAll(
              state.messages,
            );
            setState(() {});
          } else if (state is GetMessageFailureState) {
            debugPrint('======> error: ${state.error}');
          } else if (state is ChatFailureState) {
            debugPrint('======> error: ${state.error}');
          }
        },
        child: Column(
          children: [
            Expanded(
              child: MessageListWidget(
                messages: _messages.reversed.toList(),
                scrollController: _scrollController,
                agentPhoto: widget.data?.photo ?? '',
              ),
            ),
            Container(
              height: 100.0,
              color: AppColors.light.colorBrandBlue10,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ).copyWith(
                bottom: MediaQuery.paddingOf(context).bottom + 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: BaseTextFieldWidget(
                      textEditingController: _chatController,
                      focusNode: _focusNode,
                      height: 45.0,
                      background: AppColors.light.colorGrey10,
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      colorText: AppColors.light.colorTextPrimary,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: true,
                        backgroundColor: Colors.white,
                        context: AppUtils.contextMain,
                        builder: (contextDialog) {
                          return BlocProvider(
                            create: (_) => sl<ChatDetailCubit>(),
                            child: FractionallySizedBox(
                              heightFactor: .95,
                              child: SpeechToTextWidget(
                                agentModel: AIAgentModel(
                                  name: widget.data?.name,
                                  photo: widget.data?.photo,
                                  id: widget.data?.agentId,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then(
                        (value) {
                          eventBus.fire(
                            RefreshChatListEvent(),
                          );
                          context
                              .read<ChatDetailCubit>()
                              .getAgentChatHistoryAction(
                                widget.data?.agentId ?? '',
                              );
                          _chatController.clear();
                          _focusNode.unfocus();
                          setState(() {});
                        },
                      );
                    },
                    icon: Icon(
                      Icons.mic,
                      color: AppColors.light.colorBrandBlue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _sendMessageAction(
                        ChatMessageEvent.text.get(),
                        _chatController.text,
                      );
                      _chatController.clear();
                      _focusNode.unfocus();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.send,
                      color: _chatController.text.isNotEmpty
                          ? AppColors.light.colorBrandBlue
                          : AppColors.light.colorTextSecondary,
                    ),
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
