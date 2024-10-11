import 'package:event_bus/event_bus.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

class AddFavoriteEvent {
  AIAgentModel agentModel;

  AddFavoriteEvent(
    this.agentModel,
  );
}

class GoToFavoriteEvent {
  GoToFavoriteEvent();
}

class RefreshChatListEvent {
  RefreshChatListEvent();
}
