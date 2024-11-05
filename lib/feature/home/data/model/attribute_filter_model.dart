import 'package:json_annotation/json_annotation.dart';

part 'attribute_filter_model.g.dart';

@JsonSerializable()
class AttributeFilterModel {
  final String? id;

  final String? name;

  AttributeFilterModel({
    this.id,
    this.name,
  });

  factory AttributeFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeFilterModelToJson(this);
}
