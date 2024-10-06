// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AIAgentModel _$AIAgentModelFromJson(Map<String, dynamic> json) => AIAgentModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      subName: json['subName'] as String?,
      description: json['description'] as String?,
      attributes: json['attributes'] as Map<String, dynamic>?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AIAgentModelToJson(AIAgentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subName': instance.subName,
      'description': instance.description,
      'attributes': instance.attributes,
      'image': instance.image,
    };
