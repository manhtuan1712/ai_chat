// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseConversationModel _$ResponseConversationModelFromJson(
        Map<String, dynamic> json) =>
    ResponseConversationModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ConversationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseConversationModelToJson(
        ResponseConversationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
