import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/enums.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/widget/message_list_widget.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class ChatDetailScreen extends StatefulWidget {
  final ConversationModel? conversationModel;

  final Map<String, dynamic>? data;

  const ChatDetailScreen({
    super.key,
    this.conversationModel,
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

  Map<String, dynamic> _data = {};

  String _title = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _messages.add(
          MessageModel(
            answer: S.of(context).helloText,
          ),
        );
        _title =
            widget.conversationModel?.name ?? S.of(context).newConversations;
        _data = {
          'inputs': widget.data,
          'conversation_id': '',
          'query': '',
          'response_mode': 'streaming',
          'user': 'abc',
        };
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    debugPrint('======> scrollToBottom');
    Future.delayed(
      (const Duration(
        milliseconds: 100,
      )),
      () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void didChangeMetrics() {
    if (MediaQuery.viewInsetsOf(context).bottom > 0) {
      _scrollToBottom();
    }
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: AppConstants.textHeadingH3.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocListener<ChatDetailCubit, ChatDetailState>(
        listener: (context, state) {
          if (state is ChatEventReceivedState) {
            try {
              var event = jsonDecode(
                state.event,
              );
              debugPrint('======> event: ${event['data']['event']}');
              if (event['data']['event'] ==
                  ChatMessageEvent.workflowStarted.get()) {
                _data['conversation_id'] = event['data']['conversation_id'];
                _messages.last.conversation_id =
                    event['data']['conversation_id'];
                _messages.last.id = event['data']['message_id'];
              } else if (event['data']['event'] ==
                  ChatMessageEvent.workflowFinished.get()) {
                _messages.last.answer =
                    event['data']['data']['outputs']['answer'];
                _messages.last.status = MessagingStatus.done.get();
              }
            } catch (e) {
              debugPrint('======> error $e');
            }
            _scrollToBottom();
            setState(() {});
          }
        },
        child: Column(
          children: [
            Expanded(
              child: MessageListWidget(
                messages: _messages,
                scrollController: _scrollController,
              ),
            ),
            Container(
              height: _focusNode.hasFocus ? 80.0 : 120.0,
              color: Theme.of(context).colorScheme.secondary,
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
                  const SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    onPressed: () {
                      if (_chatController.text.isNotEmpty) {
                        _messages.add(
                          MessageModel(
                            query: _chatController.text,
                            status: MessagingStatus.loading.get(),
                          ),
                        );
                        _data['query'] = _chatController.text;
                        _chatController.clear();
                        _focusNode.unfocus();
                        context.read<ChatDetailCubit>().initChatStreamAction(
                              _data,
                            );
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: _chatController.text.isNotEmpty
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surfaceTint,
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
