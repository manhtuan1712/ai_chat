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

  static const text = ChatMessageEvent._internal('text');
  static const voice = ChatMessageEvent._internal('voice');
}

class MessageType {
  final String _value;

  const MessageType._internal(this._value);

  String get() => _value;

  static const userMessage = MessageType._internal('1');
  static const aiAgentMessage = MessageType._internal('2');
}

class Status {
  final String _value;

  const Status._internal(this._value);

  String get() => _value;

  static const success = MessageType._internal('success');
  static const failed = MessageType._internal('failed');
}
