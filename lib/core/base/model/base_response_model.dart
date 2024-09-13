import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  final int? limit;

  final bool? has_more;

  BaseResponseModel({
    this.limit,
    this.has_more,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}
