import 'package:json_annotation/json_annotation.dart';
import 'package:my_shop/feature/data/models/items/pagination_model.dart';
import 'items_model.dart';

part 'list_items_model.g.dart';

@JsonSerializable()
class ListItemsModel {
  final List<ItemsModel?>? items;
  final PaginationModel? pagination;

  ListItemsModel({
    required this.items,
    required this.pagination,
  });

  factory ListItemsModel.fromJson(Object? json) =>
      _$ListItemsModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ListItemsModelToJson(this);
}
