import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/api/service/base/sse_service.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/request_post_message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ParameterSelectModel>> getParameters();

  Future<List<ConversationModel>> getConversations();

  Future<Stream<String>> initChatStream(
    Map<String, dynamic> data,
  );

  Future<ConversationModel> updateConversationName(
    String conversationId,
  );

  Future<List<MessageModel>> getMessages(
    String conversationId,
  );

  Future<ConversationModel> renameConversation(
    String conversationId,
    String name,
  );

  Future<MessageModel> postMessage(
    RequestPostMessageModel requestPostMessageModel,
  );

  Future<List<int>> getVoice();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  BaseRestService baseRestService;

  ChatRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<List<ParameterSelectModel>> getParameters() async {
    try {
      final response = await baseRestService.getParameters();
      return response.user_input_form ?? [];
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<List<ConversationModel>> getConversations() async {
    try {
      final response = await baseRestService.getConversations();
      return response.data ?? [];
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<Stream<String>> initChatStream(
    Map<String, dynamic> data,
  ) async {
    try {
      SSEService sseService = SSEService(
        '${GlobalConfig.baseUrl}chat-messages',
      );
      var sseStream = sseService.stream;
      await sseService.connect(data);
      return sseStream;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ConversationModel> updateConversationName(
    String conversationId,
  ) async {
    try {
      EasyLoading.show();
      final response = await baseRestService.updateConversationName(
        conversationId,
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<List<MessageModel>> getMessages(
    String conversationId,
  ) async {
    try {
      EasyLoading.show();
      final response = await baseRestService.getMessages(
        conversationId,
      );
      EasyLoading.dismiss();
      return response.data ?? [];
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<ConversationModel> renameConversation(
    String conversationId,
    String name,
  ) async {
    try {
      EasyLoading.show();
      final response = await baseRestService.renameConversation(
        conversationId,
        name,
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<MessageModel> postMessage(
    RequestPostMessageModel requestPostMessageModel,
  ) async {
    try {
      final response = await baseRestService.postMessage(
        requestPostMessageModel,
      );
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<List<int>> getVoice() async {
    try {
      var url = Uri.parse('${GlobalConfig.chatUrl}voice');
      var response = await http.post(url);
      if (response.statusCode == 200) {
        String? contentDisposition = response.headers['content-disposition'];
        if (contentDisposition != null &&
            contentDisposition.contains('attachment')) {
          var audioBytes = response.bodyBytes;
          return audioBytes;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      debugPrint('=========> voice error ${e.toString()}');
      return [];
    }
  }
}
