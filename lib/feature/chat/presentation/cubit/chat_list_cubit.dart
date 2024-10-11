import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_chat_history.dart';

part 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  final GetChatHistory getChatHistory;

  ChatListCubit({
    required this.getChatHistory,
  }) : super(ChatListInitialState());

  Future<void> getChatHistoryAction() async {
    emit(
      ChatListLoadingState(),
    );
    final result = await getChatHistory(
      NoParams(),
    );
    result.fold(
      (l) {
        emit(
          GetChatHistoryFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          GetChatHistorySuccessState(
            messages: r,
          ),
        );
      },
    );
  }
}
