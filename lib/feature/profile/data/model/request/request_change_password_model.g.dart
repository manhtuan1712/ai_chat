// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestChangePasswordModel _$RequestChangePasswordModelFromJson(
        Map<String, dynamic> json) =>
    RequestChangePasswordModel(
      newPassword: json['newPassword'] as String?,
      oldPassword: json['oldPassword'] as String?,
    );

Map<String, dynamic> _$RequestChangePasswordModelToJson(
        RequestChangePasswordModel instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
