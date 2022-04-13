import 'package:json_annotation/json_annotation.dart';
import 'image_model.dart';
import 'package:my_shop/feature/data/models/items/colors_model.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel {
  final int? id;
  final String? title;
  final String? slug;
  final ImageModel? image;
  final int? price;
  final List<ColorsModel>? colors;

  ItemsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.price,
    required this.colors,
  });

  factory ItemsModel.fromJson(Object? json) =>
      _$ItemsModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}
