// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_post_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPostMessageModel _$RequestPostMessageModelFromJson(
        Map<String, dynamic> json) =>
    RequestPostMessageModel(
      name: json['name'] as String?,
      llm: json['llm'] as String?,
      message: json['message'] as String?,
      conversation_id: json['conversation_id'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$RequestPostMessageModelToJson(
        RequestPostMessageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'llm': instance.llm,
      'message': instance.message,
      'conversation_id': instance.conversation_id,
      'lang': instance.lang,
    };
