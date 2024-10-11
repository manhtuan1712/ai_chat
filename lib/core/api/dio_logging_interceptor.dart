import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/helpers/app_logger.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';

class DioLoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _addXApiKeyHeader(
      options,
    );
    logRequest(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logError(err);
    super.onError(err, handler);
  }

  String getErrorMessage(DioException dioError) {
    String errorDescription = 'Unexpected error occurred';
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorDescription = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        errorDescription =
            'Received invalid status code: ${dioError.response?.statusCode}';
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.badCertificate:
        errorDescription = 'API bad certificate';
        break;
      case DioExceptionType.connectionError:
        errorDescription = 'Something went wrong. Please try again later.';
        break;
      case DioExceptionType.unknown:
        errorDescription = 'Unknown error';
        break;
    }
    return errorDescription;
  }

  void logRequest(RequestOptions options) {
    var buffer = StringBuffer();
    buffer.write(
        '--> ${options.method.toUpperCase()} ${'${options.baseUrl}${options.path}'}');
    buffer.write('\nHeaders:');
    options.headers.forEach((k, v) => buffer.write(' $k: $v;'));

    buffer.write('\nParameters:');
    options.queryParameters.forEach((k, v) => buffer.write(' $k: $v;'));

    if (options.data != null) {
      buffer.write('\nBody: ${options.data}');
    }
    buffer.write('\n--> END ${options.method.toUpperCase()}');
    AppLogger.log(buffer.toString());
  }

  void logResponse(Response response) {
    var buffer = StringBuffer();
    buffer.write('<-- ${response.statusCode} ${(response.realUri)}');
    buffer.write('\nResponse: ${response.data}');
    AppLogger.log(buffer.toString());
  }

  void logError(DioException dioError) {
    var buffer = StringBuffer();
    buffer.write(
        '<-- ${dioError.message} ${(dioError.response != null ? dioError.response!.realUri : 'URL')}');
    buffer.write(
        '\n${dioError.response != null ? dioError.response!.data : 'Unknown Error'}');
    AppLogger.log(buffer.toString());
    String errorMessage = getErrorMessage(dioError);
    if (dioError.type == DioExceptionType.badResponse &&
        dioError.response!.statusCode != 200) {
      EasyLoading.dismiss();
      AppUtils.showToastMessage(
        errorMessage,
        AppUtils.contextMain,
      );
    }
  }

  void _addXApiKeyHeader(RequestOptions options) {
    options.headers['X-API-KEY'] = dotenv.env[GlobalConfig.xApiKey];
    String accessToken = AppUtils.contextMain.read<AppProvider>().accessToken;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = accessToken;
    }
  }
}
