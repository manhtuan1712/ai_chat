import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String? id;

  final String? conversation_id;

  final Map<String, String>? inputs;

  final String? query;

  final String? answer;

  final String? status;

  final int? created_at;

  MessageModel({
    this.id,
    this.conversation_id,
    this.inputs,
    this.query,
    this.answer,
    this.status,
    this.created_at,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
