import 'package:json_annotation/json_annotation.dart';
import 'package:shuei_ai_chat/core/base/model/base_response_model.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/conversation_model.dart';

part 'response_conversation_model.g.dart';

@JsonSerializable()
class ResponseConversationModel extends BaseResponseModel {
  final List<ConversationModel>? data;

  ResponseConversationModel({
    this.data,
  });

  factory ResponseConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseConversationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseConversationModelToJson(this);
}
