import 'package:json_annotation/json_annotation.dart';
import 'package:my_shop/feature/data/models/user_login/user_model.dart';
import 'basket_product_model.dart';

part 'basket_model.g.dart';

@JsonSerializable()
class BasketModel {
  BasketModel({required this.id, required this.items, required this.user});

  final int? id;
  final List<BasketProductModel?>? items;
  final UserModel? user;

  factory BasketModel.fromJson(Object? json) =>
      _$BasketModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BasketModelToJson(this);
}
