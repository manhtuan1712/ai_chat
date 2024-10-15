import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatHistoryModel>> getChatHistory();

  Future<List<MessageModel>> getAgentChatHistory(
    String agentId,
  );

  Future<MessageModel> sendMessage(
    RequestPostMessageModel request,
  );

  Future<MessageModel> sendVoiceMessage(
    RequestPostMessageModel request,
  );
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  BaseRestService baseRestService;

  ChatRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<List<ChatHistoryModel>> getChatHistory() async {
    try {
      final response = await baseRestService.getChatHistory();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<List<MessageModel>> getAgentChatHistory(
    String agentId,
  ) async {
    EasyLoading.show();
    try {
      final response = await baseRestService.getAgentChatHistory(
        agentId,
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<MessageModel> sendMessage(
    RequestPostMessageModel request,
  ) async {
    try {
      final response = await baseRestService.sendMessage(
        request,
      );
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<MessageModel> sendVoiceMessage(
    RequestPostMessageModel request,
  ) async {
    try {
      final response = await baseRestService.sendVoiceMessage(
        request,
      );
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }
}
