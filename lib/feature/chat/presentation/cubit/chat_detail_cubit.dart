import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/init_chat_stream.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  InitChatStream initChatStream;

  StreamSubscription<String>? _streamSubscription;

  ChatDetailCubit({
    required this.initChatStream,
  }) : super(ChatDetailInitialState());

  Future<void> initChatStreamAction(
    Map<String, dynamic> data,
  ) async {
    emit(
      ChatDetailLoadingState(),
    );
    final result = await initChatStream(
      InitChatParams(
        data: data,
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
        _listenToStream(
          r,
        );
      },
    );
  }

  void _listenToStream(
    Stream<String> eventStream,
  ) {
    _streamSubscription = eventStream.listen(
      (event) {
        emit(
          ChatEventReceivedState(
            event: event,
          ),
        );
      },
      onError: (error) {
        emit(
          ChatFailureState(
            error: 'An error occurred: $error',
          ),
        ); // Emit error state
      },
      onDone: () {
        // Handle stream completion if needed
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
