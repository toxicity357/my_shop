import 'package:json_annotation/json_annotation.dart';

part 'category_items_model.g.dart';

@JsonSerializable()
class CategoryItemsModel {
  final int? id;
  final String? title;
  final String? slug;

  CategoryItemsModel(
      {required this.id, required this.title, required this.slug});

  factory CategoryItemsModel.fromJson(Object? json) =>
      _$CategoryItemsModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CategoryItemsModelToJson(this);
}
