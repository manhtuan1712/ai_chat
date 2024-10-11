import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_agent_chat_history.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/send_message.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  GetAgentChatHistory getAgentChatHistory;

  SendMessage sendMessage;

  ChatDetailCubit({
    required this.getAgentChatHistory,
    required this.sendMessage,
  }) : super(ChatDetailInitialState());

  Future<void> getAgentChatHistoryAction(
    String agentId,
  ) async {
    emit(
      ChatDetailLoadingState(),
    );
    final result = await getAgentChatHistory(
      AgentChatHistoryParams(
        agentId: agentId,
      ),
    );
    result.fold(
      (l) {
        emit(
          GetMessageFailureState(
            error: l.mess ?? '',
          ),
        );
      },
      (r) {
        emit(
          GetMessageSuccessState(
            messages: r,
          ),
        );
      },
    );
  }

  Future<void> sendMessageAction(
    String query,
    String agentId,
  ) async {
    emit(
      ChatDetailLoadingState(),
    );
    final result = await sendMessage(
      SendMessageParams(
        query: query,
        agentId: agentId,
        lang: 'ja',
      ),
    );
    result.fold(
      (l) {
        emit(
          ChatFailureState(
            error: l.mess ?? '',
          ),
        );
      },
      (r) {
        emit(
          ChatEventReceivedState(
            messageModel: r,
          ),
        );
      },
    );
  }
}
