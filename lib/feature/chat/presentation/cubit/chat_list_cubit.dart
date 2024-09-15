import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_conversations.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_parameters.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/rename_conversation.dart';

part 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  GetParameters getParameters;

  GetConversations getConversations;

  RenameConversation renameConversation;

  ChatListCubit({
    required this.getParameters,
    required this.getConversations,
    required this.renameConversation,
  }) : super(ChatListInitialState());

  Future<void> getParametersAction() async {
    emit(
      ChatListLoadingState(),
    );
    final result = await getParameters(
      NoParams(),
    );
    result.fold(
      (l) {
        emit(
          GetParametersFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          GetParametersSuccessState(
            parameters: r,
          ),
        );
      },
    );
  }

  Future<void> getConversationsAction() async {
    emit(
      ChatListLoadingState(),
    );
    final result = await getConversations(
      NoParams(),
    );
    result.fold(
      (l) {
        emit(
          GetConversationsFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          GetConversationsSuccessState(
            conversations: r,
          ),
        );
      },
    );
  }

  Future<void> renameConversationAction(
    String conversationId,
    String name,
  ) async {
    emit(
      ChatListLoadingState(),
    );
    final result = await renameConversation(
      RenameConversationNameParams(
        conversationId: conversationId,
        name: name,
      ),
    );
    result.fold(
      (l) {
        emit(
          RenameConversationFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          RenameConversationSuccessState(
            conversation: r,
          ),
        );
      },
    );
  }
}
