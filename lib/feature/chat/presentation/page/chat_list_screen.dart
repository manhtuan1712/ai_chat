import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/widget/create_chat_dialog_widget.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/widget/empty_chat_list_widget.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  ChatListScreenState createState() => ChatListScreenState();
}

class ChatListScreenState extends State<ChatListScreen> {
  List<ConversationModel>? _conversations;

  List<ParameterSelectModel> _parameters = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<ChatListCubit>()
        ..getParametersAction()
        ..getConversationsAction(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤖 ${S.of(context).appTitle}',
          style: AppConstants.textHeadingH3.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 8.0,
        ),
        child: BlocListener<ChatListCubit, ChatListState>(
          listener: (context, state) {
            if (state is GetParametersSuccessState) {
              _parameters = state.parameters;
            }
          },
          child: BaseButtonWidget(
            text: S.of(context).addNewConversationCTA,
            onClick: () => showDialog(
              context: AppUtils.contextMain,
              builder: (contextModal) => CreateChatDialogWidget(
                parameters: _parameters,
                callBack: (data) {
                  debugPrint('======> $data');
                },
              ),
            ),
            buttonState: ButtonState.normal,
          ),
        ),
      ),
      body: BlocListener<ChatListCubit, ChatListState>(
        listener: (context, state) {
          if (state is GetConversationsSuccessState) {
            _conversations = state.conversations;
            setState(() {});
          }
        },
        child: _conversations?.isEmpty ?? false
            ? const EmptyChatListWidget()
            : ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _conversations?.length ?? 0,
                itemBuilder: (context, index) {
                  final ConversationModel conversation = _conversations![index];
                  return ListTile(
                    title: Text(
                      conversation.name ?? '',
                      style: AppConstants.textHeadingH5.copyWith(
                        color: Theme.of(context).colorScheme.surfaceDim,
                      ),
                    ),
                    subtitle: Text(
                      conversation.introduction ?? '',
                      style: AppConstants.textBody2Regular.copyWith(
                        color: Theme.of(context).colorScheme.surfaceDim,
                      ),
                    ),
                    onTap: () => {},
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8.0,
                ),
              ),
      ),
    );
  }
}