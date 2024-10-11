// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatHistoryModel _$ChatHistoryModelFromJson(Map<String, dynamic> json) =>
    ChatHistoryModel(
      agentId: json['agentId'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      age: json['age'] as num?,
      note: json['note'] as String?,
      lastMessage: json['lastMessage'] as String?,
    );

Map<String, dynamic> _$ChatHistoryModelToJson(ChatHistoryModel instance) =>
    <String, dynamic>{
      'agentId': instance.agentId,
      'name': instance.name,
      'photo': instance.photo,
      'age': instance.age,
      'note': instance.note,
      'lastMessage': instance.lastMessage,
    };
