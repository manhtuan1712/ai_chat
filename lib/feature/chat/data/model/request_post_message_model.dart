import 'package:json_annotation/json_annotation.dart';

part 'request_post_message_model.g.dart';

@JsonSerializable()
class RequestPostMessageModel {
  final String? name;

  final String? llm;

  final String? message;

  final String? conversation_id;

  final String? lang;

  String? user;

  RequestPostMessageModel({
    this.name,
    this.llm,
    this.message,
    this.conversation_id,
    this.lang,
    this.user,
  });

  factory RequestPostMessageModel.fromJson(Map<String, dynamic> json) =>
      _$RequestPostMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostMessageModelToJson(this);
}
