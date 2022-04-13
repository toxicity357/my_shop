import 'package:json_annotation/json_annotation.dart';
import 'category_items_model.dart';

part 'category_list_items_model.g.dart';

@JsonSerializable()
class CategoryListItemsModel {
  final List<CategoryItemsModel?> items;

  CategoryListItemsModel({
    required this.items,
  });

  factory CategoryListItemsModel.fromJson(Object? json) =>
      _$CategoryListItemsModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CategoryListItemsModelToJson(this);
}
