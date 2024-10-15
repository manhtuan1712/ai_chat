// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AIAgentModel _$AIAgentModelFromJson(Map<String, dynamic> json) => AIAgentModel(
      id: json['id'] as String?,
      agentId: json['agentId'] as String?,
      name: json['name'] as String?,
      place: json['place'] as String?,
      age: json['age'] as num?,
      note: json['note'] as String?,
      photo: json['photo'] as String?,
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$AIAgentModelToJson(AIAgentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agentId': instance.agentId,
      'name': instance.name,
      'place': instance.place,
      'age': instance.age,
      'note': instance.note,
      'photo': instance.photo,
      'favorite': instance.favorite,
    };
