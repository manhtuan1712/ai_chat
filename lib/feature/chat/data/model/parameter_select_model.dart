import 'package:json_annotation/json_annotation.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/select_model.dart';

part 'parameter_select_model.g.dart';

@JsonSerializable()
class ParameterSelectModel {
  final SelectModel? select;

  ParameterSelectModel({
    this.select,
  });

  factory ParameterSelectModel.fromJson(Map<String, dynamic> json) =>
      _$ParameterSelectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterSelectModelToJson(this);
}
