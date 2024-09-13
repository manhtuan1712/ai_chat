import 'package:json_annotation/json_annotation.dart';

part 'conversation_model.g.dart';

@JsonSerializable()
class ConversationModel {
  final String? id;

  final String? name;

  final List<String>? inputs;

  final String? status;

  final String? introduction;

  final int? created_at;

  ConversationModel({
    this.id,
    this.name,
    this.inputs,
    this.status,
    this.introduction,
    this.created_at,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}