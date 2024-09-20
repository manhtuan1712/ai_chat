import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  String? id;

  String? conversation_id;

  Map<String, String>? inputs;

  String? query;

  String? answer;

  String? status;

  int? created_at;

  String? message;

  MessageModel({
    this.id,
    this.conversation_id,
    this.inputs,
    this.query,
    this.answer,
    this.status,
    this.created_at,
    this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
