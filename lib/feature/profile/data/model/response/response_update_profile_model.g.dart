// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_update_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUpdateProfileModel _$ResponseUpdateProfileModelFromJson(
        Map<String, dynamic> json) =>
    ResponseUpdateProfileModel(
      message: json['message'] as String?,
      profile: json['profile'] == null
          ? null
          : RequestUpdateProfileModel.fromJson(
              json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseUpdateProfileModelToJson(
        ResponseUpdateProfileModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'profile': instance.profile,
    };
