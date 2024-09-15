part of 'chat_list_cubit.dart';

@immutable
abstract class ChatListState {}

class ChatListInitialState extends ChatListState {}

class ChatListLoadingState extends ChatListState {}

class GetParametersSuccessState extends ChatListState {
  final List<ParameterSelectModel> parameters;

  GetParametersSuccessState({
    required this.parameters,
  });
}

class GetParametersFailureState extends ChatListState {
  final String? error;

  GetParametersFailureState({
    this.error,
  });
}

class GetConversationsSuccessState extends ChatListState {
  final List<ConversationModel> conversations;

  GetConversationsSuccessState({
    required this.conversations,
  });
}

class GetConversationsFailureState extends ChatListState {
  final String? error;

  GetConversationsFailureState({
    this.error,
  });
}

class RenameConversationSuccessState extends ChatListState {
  final ConversationModel conversation;

  RenameConversationSuccessState({
    required this.conversation,
  });
}

class RenameConversationFailureState extends ChatListState {
  final String? error;

  RenameConversationFailureState({
    this.error,
  });
}
