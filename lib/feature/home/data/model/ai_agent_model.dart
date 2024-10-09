import 'package:json_annotation/json_annotation.dart';

part 'ai_agent_model.g.dart';

@JsonSerializable()
class AIAgentModel {
  final String? id;

  final String? name;

  final String? place;

  final num? age;

  final String? note;

  final String? photo;

  AIAgentModel({
    this.id,
    this.name,
    this.place,
    this.age,
    this.note,
    this.photo,
  });

  factory AIAgentModel.fromJson(Map<String, dynamic> json) =>
      _$AIAgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AIAgentModelToJson(this);
}
