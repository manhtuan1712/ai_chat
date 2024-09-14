import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/chat/data/datasource/chat_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({
    required this.chatRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<ParameterSelectModel>>>
      getParameters() async {
    try {
      var response = await chatRemoteDataSource.getParameters();
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
  Future<Either<ServerFailure, List<ConversationModel>>>
      getConversations() async {
    try {
      var response = await chatRemoteDataSource.getConversations();
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
  Future<Either<ServerFailure, Stream<String>>> initChatStream(
    Map<String, dynamic> data,
  ) async {
    try {
      var response = await chatRemoteDataSource.initChatStream(
        data,
      );
      return Right(
        response,
      );
    } catch (e) {
      return Left(
        ServerFailure(
          mess: e.toString(),
        ),
      );
    }
  }
}
