import 'package:json_annotation/json_annotation.dart';

part 'request_change_password_model.g.dart';

@JsonSerializable()
class RequestChangePasswordModel {
  final String? oldPassword;

  final String? newPassword;

  RequestChangePasswordModel({
    this.newPassword,
    this.oldPassword,
  });

  factory RequestChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$RequestChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestChangePasswordModelToJson(this);
}
