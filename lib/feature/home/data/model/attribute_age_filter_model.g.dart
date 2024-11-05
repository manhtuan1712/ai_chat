// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_age_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeAgeFilterModel _$AttributeAgeFilterModelFromJson(
        Map<String, dynamic> json) =>
    AttributeAgeFilterModel(
      id: (json['id'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AttributeAgeFilterModelToJson(
        AttributeAgeFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
