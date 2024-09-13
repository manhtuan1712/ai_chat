// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMessageModel _$ResponseMessageModelFromJson(
        Map<String, dynamic> json) =>
    ResponseMessageModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseMessageModelToJson(
        ResponseMessageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
