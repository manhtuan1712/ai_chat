import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/helpers/enums.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<AIAgentModel>> getFavorites(
    Map<String, dynamic> queries,
  );

  Future<String> addFavorite(
    String agentId,
  );

  Future<String> removeFavorite(
    String agentId,
  );
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  BaseRestService baseRestService;

  FavoriteRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<List<AIAgentModel>> getFavorites(
    Map<String, dynamic> queries,
  ) async {
    EasyLoading.show();
    try {
      final response = await baseRestService.getFavorites(
        queries,
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<String> addFavorite(String agentId) async {
    EasyLoading.show();
    try {
      await baseRestService.addFavorite(
        agentId,
      );
      EasyLoading.dismiss();
      return Status.success.get();
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<String> removeFavorite(
    String agentId,
  ) async {
    EasyLoading.show();
    try {
      await baseRestService.removeFavorite(
        agentId,
      );
      EasyLoading.dismiss();
      return Status.success.get();
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }
}
