// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_post_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPostMessageModel _$RequestPostMessageModelFromJson(
        Map<String, dynamic> json) =>
    RequestPostMessageModel(
      query: json['query'] as String?,
      agentId: json['agentId'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$RequestPostMessageModelToJson(
        RequestPostMessageModel instance) =>
    <String, dynamic>{
      'query': instance.query,
      'agentId': instance.agentId,
      'lang': instance.lang,
    };
