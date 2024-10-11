import 'package:json_annotation/json_annotation.dart';

part 'request_post_message_model.g.dart';

@JsonSerializable()
class RequestPostMessageModel {
  final String? query;

  final String? agentId;

  final String? lang;

  RequestPostMessageModel({
    this.query,
    this.agentId,
    this.lang,
  });

  factory RequestPostMessageModel.fromJson(Map<String, dynamic> json) =>
      _$RequestPostMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostMessageModelToJson(this);
}
