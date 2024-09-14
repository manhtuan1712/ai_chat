class MessagingStatus {
  final String _value;

  const MessagingStatus._internal(this._value);

  String get() => _value;

  static const loading = MessagingStatus._internal('loading');
  static const done = MessagingStatus._internal('done');
}

class ChatMessageEvent {
  final String _value;

  const ChatMessageEvent._internal(this._value);

  String get() => _value;

  static const workflowStarted = ChatMessageEvent._internal('workflow_started');
  static const workflowFinished =
      ChatMessageEvent._internal('workflow_finished');
}
