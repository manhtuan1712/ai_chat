part of 'chat_detail_cubit.dart';

@immutable
abstract class ChatDetailState {}

class ChatDetailInitialState extends ChatDetailState {}

class ChatDetailLoadingState extends ChatDetailState {}

class ChatEventReceivedState extends ChatDetailState {
  final String event;

  ChatEventReceivedState({
    required this.event,
  });
}

class ChatFailureState extends ChatDetailState {
  final String error;

  ChatFailureState({
    required this.error,
  });
}
