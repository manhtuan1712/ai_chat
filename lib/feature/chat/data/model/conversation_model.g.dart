// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    ConversationModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      inputs:
          (json['inputs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      introduction: json['introduction'] as String?,
      created_at: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'inputs': instance.inputs,
      'status': instance.status,
      'introduction': instance.introduction,
      'created_at': instance.created_at,
    };