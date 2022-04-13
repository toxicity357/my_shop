import 'package:json_annotation/json_annotation.dart';
import 'package:my_shop/feature/data/models/items/items_model.dart';

part 'basket_product_model.g.dart';

@JsonSerializable()
class BasketProductModel {
  BasketProductModel({
    required this.id,
    required this.price,
    required this.quantity,
    required this.product,
  });

  final int? id;
  final int? price;
  final int? quantity;
  final ItemsModel? product;

  factory BasketProductModel.fromJson(Object? json) =>
      _$BasketProductModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BasketProductModelToJson(this);
}
