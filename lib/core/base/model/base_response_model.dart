import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  final String? status;

  final String? message;

  final String? code;

  BaseResponseModel({
    this.status,
    this.message,
    this.code,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}
