// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      type: json['type'] as String?,
      created_at: (json['created_at'] as num?)?.toInt(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'created_at': instance.created_at,
      'message': instance.message,
      'status': instance.status,
    };
