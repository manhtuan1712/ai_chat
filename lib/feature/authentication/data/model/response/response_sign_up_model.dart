import 'package:json_annotation/json_annotation.dart';

part 'response_sign_up_model.g.dart';

@JsonSerializable()
class ResponseSignUpModel {
  final String? message;

  ResponseSignUpModel({
    this.message,
  });

  factory ResponseSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseSignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseSignUpModelToJson(this);
}
