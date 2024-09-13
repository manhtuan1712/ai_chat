// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel(
      limit: (json['limit'] as num?)?.toInt(),
      has_more: json['has_more'] as bool?,
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'has_more': instance.has_more,
    };
