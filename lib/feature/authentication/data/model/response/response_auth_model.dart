import 'package:json_annotation/json_annotation.dart';

part 'response_auth_model.g.dart';

@JsonSerializable()
class ResponseAuthModel {
  final String? name;

  final String? token;

  ResponseAuthModel({
    this.name,
    this.token,
  });

  factory ResponseAuthModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseAuthModelToJson(this);
}
