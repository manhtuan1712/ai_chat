// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectModel _$SelectModelFromJson(Map<String, dynamic> json) => SelectModel(
      variable: json['variable'] as String?,
      label: json['label'] as String?,
      required: json['required'] as bool?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SelectModelToJson(SelectModel instance) =>
    <String, dynamic>{
      'variable': instance.variable,
      'label': instance.label,
      'required': instance.required,
      'options': instance.options,
    };
