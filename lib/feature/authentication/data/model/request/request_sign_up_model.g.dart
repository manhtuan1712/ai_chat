// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestSignUpModel _$RequestSignUpModelFromJson(Map<String, dynamic> json) =>
    RequestSignUpModel(
      id: json['id'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RequestSignUpModelToJson(RequestSignUpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'name': instance.name,
    };
