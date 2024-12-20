import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_change_password_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/response/response_update_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ResponseSignUpModel> changePassword(
    RequestChangePasswordModel request,
  );

  Future<RequestUpdateProfileModel> getProfile();

  Future<ResponseUpdateProfileModel> updateProfile(
    RequestUpdateProfileModel request,
  );
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  BaseRestService baseRestService;

  ProfileRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<ResponseSignUpModel> changePassword(
    RequestChangePasswordModel request,
  ) async {
    EasyLoading.show();
    try {
      final response = await baseRestService.changePassword(
        request,
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<RequestUpdateProfileModel> getProfile() async {
    EasyLoading.show();
    try {
      final response = await baseRestService.getProfile();
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<ResponseUpdateProfileModel> updateProfile(
    RequestUpdateProfileModel request,
  ) async {
    EasyLoading.show();
    try {
      final response = await baseRestService.updateProfile(
        request,
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }
}
