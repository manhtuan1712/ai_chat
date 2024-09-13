// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String?,
      conversation_id: json['conversation_id'] as String?,
      inputs: (json['inputs'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      query: json['query'] as String?,
      answer: json['answer'] as String?,
      status: json['status'] as String?,
      created_at: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversation_id,
      'inputs': instance.inputs,
      'query': instance.query,
      'answer': instance.answer,
      'status': instance.status,
      'created_at': instance.created_at,
    };
