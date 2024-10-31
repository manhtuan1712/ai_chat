// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_update_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestUpdateProfileModel _$RequestUpdateProfileModelFromJson(
        Map<String, dynamic> json) =>
    RequestUpdateProfileModel(
      name: json['name'] as String?,
      age: json['age'] as num?,
      location: json['location'] as String?,
      hobbies: json['hobbies'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RequestUpdateProfileModelToJson(
        RequestUpdateProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'location': instance.location,
      'hobbies': instance.hobbies,
      'description': instance.description,
    };
