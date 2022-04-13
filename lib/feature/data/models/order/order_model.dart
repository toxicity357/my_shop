import 'package:json_annotation/json_annotation.dart';
import 'package:my_shop/feature/data/models/basket/basket_model.dart';
import 'package:my_shop/feature/data/models/order/status_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  OrderModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.basket,
    required this.totalPrice,
    required this.comment,
    required this.status,
  });

  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final BasketModel? basket;
  final int? totalPrice;
  final String? comment;
  final StatusModel? status;

  factory OrderModel.fromJson(Object? json) =>
      _$OrderModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
