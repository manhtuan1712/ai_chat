// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_parameter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseParameterModel _$ResponseParameterModelFromJson(
        Map<String, dynamic> json) =>
    ResponseParameterModel(
      user_input_form: (json['user_input_form'] as List<dynamic>?)
          ?.map((e) => ParameterSelectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseParameterModelToJson(
        ResponseParameterModel instance) =>
    <String, dynamic>{
      'user_input_form': instance.user_input_form,
    };
