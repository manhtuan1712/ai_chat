import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/chat/data/datasource/chat_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({
    required this.chatRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<ChatHistoryModel>>> getChatHistory() async {
    try {
      var response = await chatRemoteDataSource.getChatHistory();
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<MessageModel>>> getAgentChatHistory(
    String agentId,
  ) async {
    try {
      var response = await chatRemoteDataSource.getAgentChatHistory(
        agentId,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      EasyLoading.dismiss();
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, MessageModel>> sendMessage(
    RequestPostMessageModel request,
  ) async {
    try {
      var response = await chatRemoteDataSource.sendMessage(
        request,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, MessageModel>> sendVoiceMessage(
    RequestPostMessageModel request,
  ) async {
    try {
      var response = await chatRemoteDataSource.sendVoiceMessage(
        request,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }
}
