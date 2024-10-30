import 'package:json_annotation/json_annotation.dart';

part 'request_update_profile_model.g.dart';

@JsonSerializable()
class RequestUpdateProfileModel {
  final String? name;

  final num? age;

  final String? location;

  final String? hobbies;

  final String? description;

  RequestUpdateProfileModel({
    this.name,
    this.age,
    this.location,
    this.hobbies,
    this.description,
  });

  factory RequestUpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      _$RequestUpdateProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestUpdateProfileModelToJson(this);
}
