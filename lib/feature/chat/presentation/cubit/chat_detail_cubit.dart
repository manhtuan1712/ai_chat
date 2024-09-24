import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_messages.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_voice.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/init_chat_stream.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/post_message_case.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/update_conversation_name.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  InitChatStream initChatStream;

  UpdateConversationName updateConversationName;

  GetMessages getMessages;

  PostMessage postMessage;

  GetVoice getVoice;

  ChatDetailCubit({
    required this.initChatStream,
    required this.updateConversationName,
    required this.getMessages,
    required this.postMessage,
    required this.getVoice,
  }) : super(ChatDetailInitialState());

  Future<void> updateConversationNameAction(
    String conversationId,
  ) async {
    emit(
      ChatDetailLoadingState(),
    );
    final result = await updateConversationName(
      UpdateConversationNameParams(
        conversationId: conversationId,
      ),
    );
    result.fold(
      (l) {
        emit(
          UpdateConversationNameFailureState(
            error: l.mess ?? '',
          ),
        );
      },
      (r) {
        emit(
          UpdateConversationNameSuccessState(
            conversationModel: r,
          ),
        );
      },
    );
  }

  Future<void> getMessagesAction(
    String conversationId,
  ) async {
    emit(
      ChatDetailLoadingState(),
    );
    final result = await getMessages(
      UpdateConversationNameParams(
        conversationId: conversationId,
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

  Future<void> postMessageAction(
    String name,
    String llm,
    String message,
    String conversationId,
    String lang,
  ) async {
    emit(
      ChatDetailLoadingState(),
    );
    final result = await postMessage(
      PostMessageParams(
        requestPostMessageModel: RequestPostMessageModel(
          conversation_id: conversationId,
          name: name,
          llm: llm,
          message: message,
          lang: lang,
        ),
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

  Future<void> getVoiceAction() async {
    final result = await getVoice(
      NoParams(),
    );
    result.fold(
      (l) => emit(
        GetVoiceFailureState(
          error: l.mess ?? '',
        ),
      ),
      (r) => emit(
        GetVoiceSuccessState(
          voice: r,
        ),
      ),
    );
  }
}
