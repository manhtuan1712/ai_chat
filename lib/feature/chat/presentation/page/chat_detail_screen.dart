import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/enums.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
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

  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _audioPlayer.onPlayerComplete.listen(
          (event) {
            _isPlaying = false;
            setState(() {});
          },
        );
        _title =
            widget.conversationModel?.name ?? S.of(context).newConversations;
        _data = {
          'inputs': widget.data,
          'conversation_id': widget.conversationModel?.id ?? '',
          'query': '',
          'response_mode': 'streaming',
          'user': context.read<AppProvider>().user,
        };
        if (widget.conversationModel?.id != '') {
          context.read<ChatDetailCubit>().getMessagesAction(
                widget.conversationModel?.id ?? '',
              );
        } else {
          _messages.add(
            MessageModel(
              answer: S.of(context).helloText,
            ),
          );
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    var height = MediaQuery.sizeOf(context).height * 1.5;
    Future.delayed(
      (const Duration(
        milliseconds: 500,
      )),
      () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + height,
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
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocListener<ChatDetailCubit, ChatDetailState>(
        listener: (context, state) async {
          if (state is ChatEventReceivedState) {
            context.read<ChatDetailCubit>().getVoiceAction();
            if (_data['conversation_id'] == '') {
              context.read<ChatDetailCubit>().updateConversationNameAction(
                    state.messageModel.conversation_id ?? '',
                  );
            }
            _messages.last.answer = state.messageModel.message;
            _messages.last.status = MessagingStatus.done.get();
            _messages.last.conversation_id = state.messageModel.conversation_id;
            _messages.last.id = state.messageModel.id;
            _data['conversation_id'] = state.messageModel.conversation_id;
            _scrollToBottom();
            setState(() {});
          } else if (state is UpdateConversationNameSuccessState) {
            _title = state.conversationModel.name ?? '';
            context.read<ChatListCubit>().getConversationsAction();
            setState(() {});
          } else if (state is GetMessageSuccessState) {
            _messages.clear();
            _messages.add(
              MessageModel(
                answer: S.of(context).helloText,
              ),
            );
            _messages.addAll(
              state.messages,
            );
            setState(() {});
            _scrollToBottom();
          } else if (state is GetVoiceSuccessState) {
            _isPlaying = true;
            _audioPlayer.setReleaseMode(ReleaseMode.stop);
            await _audioPlayer.setSource(
              BytesSource(
                Uint8List.fromList(
                  state.voice,
                ),
              ),
            );
            await _audioPlayer.resume();
            setState(() {});
          } else if (state is GetMessageFailureState) {
            debugPrint('======> error: ${state.error}');
          } else if (state is UpdateConversationNameFailureState) {
            debugPrint('======> error: ${state.error}');
          } else if (state is ChatFailureState) {
            debugPrint('======> error: ${state.error}');
          } else if (state is GetVoiceFailureState) {
            debugPrint('======> error: ${state.error}');
          }
        },
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  child: Image.asset(
                    AppConstants.icPersonalAssistant,
                    fit: BoxFit.fill,
                    width: 180.0,
                  ),
                ),
                Visibility(
                  visible: _isPlaying,
                  child: Positioned(
                    bottom: 5.0,
                    left: 0.0,
                    right: 0.0,
                    child: SpinKitWave(
                      color: Theme.of(context).colorScheme.primary,
                      size: 24.0,
                    ),
                  ),
                )
              ],
            ),
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
                        context.read<ChatDetailCubit>().postMessageAction(
                              _data['inputs']['personal'],
                              _data['inputs']['LLM'],
                              _data['query'],
                              _data['conversation_id'],
                              _data['inputs']['lang'] ?? '',
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
