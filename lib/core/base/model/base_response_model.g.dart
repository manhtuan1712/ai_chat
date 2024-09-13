// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
