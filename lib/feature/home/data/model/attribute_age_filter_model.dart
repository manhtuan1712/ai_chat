import 'package:json_annotation/json_annotation.dart';

part 'attribute_age_filter_model.g.dart';

@JsonSerializable()
class AttributeAgeFilterModel {
  final List<int>? id;

  final String? name;

  AttributeAgeFilterModel({
    this.id,
    this.name,
  });

  factory AttributeAgeFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeAgeFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeAgeFilterModelToJson(this);
}
