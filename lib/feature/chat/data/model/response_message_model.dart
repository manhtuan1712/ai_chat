import 'package:json_annotation/json_annotation.dart';
import 'package:shuei_ai_chat/core/base/model/base_response_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/message_model.dart';

part 'response_message_model.g.dart';

@JsonSerializable()
class ResponseMessageModel extends BaseResponseModel {
  final List<MessageModel>? data;

  ResponseMessageModel({
    this.data,
  });

  factory ResponseMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseMessageModelToJson(this);
}
