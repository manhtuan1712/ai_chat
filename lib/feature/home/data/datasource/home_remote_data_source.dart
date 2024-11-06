import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<AIAgentModel>> getRecommendAgent(
    Map<String, dynamic> queries,
  );

  Future<List<AttributeFilterModel>> getListOccupation();

  Future<List<AttributeFilterModel>> getListHobbies();

  Future<List<AttributeFilterModel>> getListGenders();

  Future<List<AttributeAgeFilterModel>> getListAges();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  BaseRestService baseRestService;

  HomeRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<List<AIAgentModel>> getRecommendAgent(
    Map<String, dynamic> queries,
  ) async {
    EasyLoading.show();
    try {
      final response = await baseRestService.getRecommendAgent(
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
  Future<List<AttributeAgeFilterModel>> getListAges() async {
    try {
      final response = await baseRestService.getListAges();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<List<AttributeFilterModel>> getListGenders() async {
    try {
      final response = await baseRestService.getListGenders();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<List<AttributeFilterModel>> getListHobbies() async {
    try {
      final response = await baseRestService.getListHobbies();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<List<AttributeFilterModel>> getListOccupation() async {
    try {
      final response = await baseRestService.getListOccupation();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }
}
