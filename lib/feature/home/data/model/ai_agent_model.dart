import 'package:json_annotation/json_annotation.dart';

part 'ai_agent_model.g.dart';

@JsonSerializable()
class AIAgentModel {
  final String? id;

  final String? name;

  final String? subName;

  final String? description;

  final Map<String, dynamic>? attributes;

  final String? image;

  AIAgentModel({
    this.id,
    this.name,
    this.subName,
    this.description,
    this.attributes,
    this.image,
  });

  factory AIAgentModel.fromJson(Map<String, dynamic> json) =>
      _$AIAgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AIAgentModelToJson(this);
}
