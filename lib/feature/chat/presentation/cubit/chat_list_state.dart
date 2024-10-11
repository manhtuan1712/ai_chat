part of 'chat_list_cubit.dart';

@immutable
abstract class ChatListState {}

class ChatListInitialState extends ChatListState {}

class ChatListLoadingState extends ChatListState {}

class GetChatHistorySuccessState extends ChatListState {
  final List<ChatHistoryModel> messages;

  GetChatHistorySuccessState({
    required this.messages,
  });
}

class GetChatHistoryFailureState extends ChatListState {
  final String? error;

  GetChatHistoryFailureState({
    this.error,
  });
}
