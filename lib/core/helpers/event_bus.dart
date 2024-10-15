import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

class GoToFavoriteEvent {
  GoToFavoriteEvent();
}

class RefreshChatListEvent {
  RefreshChatListEvent();
}
