import 'package:json_annotation/json_annotation.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/parameter_select_model.dart';

part 'response_parameter_model.g.dart';

@JsonSerializable()
class ResponseParameterModel {
  final List<ParameterSelectModel>? user_input_form;

  ResponseParameterModel({
    this.user_input_form,
  });

  factory ResponseParameterModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseParameterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseParameterModelToJson(this);
}
