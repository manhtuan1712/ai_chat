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
