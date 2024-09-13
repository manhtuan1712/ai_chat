import 'package:json_annotation/json_annotation.dart';

part 'select_model.g.dart';

@JsonSerializable()
class SelectModel {
  final String? variable;

  final String? label;

  final bool? required;

  final List<String>? options;

  SelectModel({
    this.variable,
    this.label,
    this.required,
    this.options,
  });

  factory SelectModel.fromJson(Map<String, dynamic> json) =>
      _$SelectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectModelToJson(this);
}
