import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/api/service/base/sse_service.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ParameterSelectModel>> getParameters();

  Future<List<ConversationModel>> getConversations();

  Future<Stream<String>> initChatStream(
    Map<String, dynamic> data,
  );
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
      EasyLoading.show();
      final response = await baseRestService.getConversations();
      EasyLoading.dismiss();
      return response.data ?? [];
    } on DioExceptionType {
      EasyLoading.dismiss();
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
}
