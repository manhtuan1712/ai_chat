import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class InitChatParams extends Equatable {
  final Map<String, dynamic> data;

  const InitChatParams({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class UpdateConversationNameParams extends Equatable {
  final String conversationId;

  const UpdateConversationNameParams({
    required this.conversationId,
  });

  @override
  List<Object> get props => [conversationId];
}

class RenameConversationNameParams extends Equatable {
  final String conversationId;

  final String name;

  const RenameConversationNameParams({
    required this.conversationId,
    required this.name,
  });

  @override
  List<Object> get props => [conversationId];
}

class PostMessageParams extends Equatable {
  final RequestPostMessageModel requestPostMessageModel;

  const PostMessageParams({
    required this.requestPostMessageModel,
  });

  @override
  List<Object> get props => [requestPostMessageModel];
}

class AuthParams extends Equatable {
  final String id;

  final String password;

  const AuthParams({
    required this.id,
    required this.password,
  });

  @override
  List<Object> get props => [
        id,
        password,
      ];
}

class SignUpParams extends Equatable {
  final String id;

  final String name;

  final String password;

  const SignUpParams({
    required this.id,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [
        id,
        password,
        name,
      ];
}

class AgentChatHistoryParams extends Equatable {
  final String agentId;

  const AgentChatHistoryParams({
    required this.agentId,
  });

  @override
  List<Object> get props => [
        agentId,
      ];
}

class SendMessageParams extends Equatable {
  final String query;

  final String agentId;

  final String lang;

  const SendMessageParams({
    required this.query,
    required this.agentId,
    required this.lang,
  });

  @override
  List<Object> get props => [
        query,
        agentId,
        lang,
      ];
}

class AddFavoriteParam extends Equatable {
  final String agentId;

  const AddFavoriteParam({
    required this.agentId,
  });

  @override
  List<Object> get props => [
        agentId,
      ];
}
