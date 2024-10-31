import 'package:json_annotation/json_annotation.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';

part 'response_update_profile_model.g.dart';

@JsonSerializable()
class ResponseUpdateProfileModel {
  final String? message;

  final RequestUpdateProfileModel? profile;

  ResponseUpdateProfileModel({
    this.message,
    this.profile,
  });

  factory ResponseUpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseUpdateProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUpdateProfileModelToJson(this);
}
