import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<AIAgentModel>> getRecommendAgent();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  BaseRestService baseRestService;

  HomeRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<List<AIAgentModel>> getRecommendAgent() async {
    EasyLoading.show();
    try {
      final response = await baseRestService.getRecommendAgent();
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }
}
