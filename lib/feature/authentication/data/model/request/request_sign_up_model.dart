import 'package:json_annotation/json_annotation.dart';

part 'request_sign_up_model.g.dart';

@JsonSerializable()
class RequestSignUpModel {
  final String? id;

  final String? password;

  final String? name;

  RequestSignUpModel({
    this.id,
    this.password,
    this.name,
  });

  factory RequestSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$RequestSignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSignUpModelToJson(this);
}
