part of 'chat_detail_cubit.dart';

@immutable
abstract class ChatDetailState {}

class ChatDetailInitialState extends ChatDetailState {}

class ChatDetailLoadingState extends ChatDetailState {}

class ChatReceivedState extends ChatDetailState {
  final MessageModel messageModel;

  ChatReceivedState({
    required this.messageModel,
  });
}

class ChatFailureState extends ChatDetailState {
  final String error;

  ChatFailureState({
    required this.error,
  });
}

class ChatVoiceReceivedState extends ChatDetailState {
  final MessageModel messageModel;

  ChatVoiceReceivedState({
    required this.messageModel,
  });
}

class ChatVoiceFailureState extends ChatDetailState {
  final String error;

  ChatVoiceFailureState({
    required this.error,
  });
}

class GetMessageSuccessState extends ChatDetailState {
  final List<MessageModel> messages;

  GetMessageSuccessState({
    required this.messages,
  });
}

class GetMessageFailureState extends ChatDetailState {
  final String error;

  GetMessageFailureState({
    required this.error,
  });
}
