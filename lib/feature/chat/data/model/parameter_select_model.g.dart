// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_select_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterSelectModel _$ParameterSelectModelFromJson(
        Map<String, dynamic> json) =>
    ParameterSelectModel(
      select: json['select'] == null
          ? null
          : SelectModel.fromJson(json['select'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParameterSelectModelToJson(
        ParameterSelectModel instance) =>
    <String, dynamic>{
      'select': instance.select,
    };
