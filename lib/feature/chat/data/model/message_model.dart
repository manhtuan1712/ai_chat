import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  String? type;

  int? created_at;

  String? message;

  String? status;

  String get messageFormat => (message ?? '').replaceAll(
        '\n',
        '',
      );

  MessageModel({
    this.type,
    this.created_at,
    this.message,
    this.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
