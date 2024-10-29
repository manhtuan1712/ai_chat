import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/request/request_sign_up_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_auth_model.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response/response_sign_up_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<ResponseAuthModel> auth(
    String id,
    String password,
  );

  Future<ResponseSignUpModel> signUp(
    RequestSignUpModel request,
  );
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  BaseRestService baseRestService;

  AuthenticationRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<ResponseAuthModel> auth(
    String id,
    String password,
  ) async {
    EasyLoading.show();
    try {
      AppProvider appProvider = AppUtils.contextMain.read<AppProvider>();
      final response = await baseRestService.auth(
        id,
        password,
      );
      appProvider.setAccessToken(
        response.token ?? '',
      );
      appProvider.setUser(
        response.name ?? '',
      );
      EasyLoading.dismiss();
      return response;
    } on DioExceptionType {
      EasyLoading.dismiss();
      throw DioExceptionType;
    }
  }

  @override
  Future<ResponseSignUpModel> signUp(
    RequestSignUpModel request,
  ) async {
    EasyLoading.show();
    try {
      final response = await baseRestService.signUp(
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
