import 'package:json_annotation/json_annotation.dart';

part 'chat_history_model.g.dart';

@JsonSerializable()
class ChatHistoryModel {
  final String? agentId;

  final String? name;

  final String? photo;

  final num? age;

  final String? note;

  final String? lastMessage;

  ChatHistoryModel({
    this.agentId,
    this.name,
    this.photo,
    this.age,
    this.note,
    this.lastMessage,
  });

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatHistoryModelToJson(this);
}
