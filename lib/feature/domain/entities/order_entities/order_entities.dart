import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/basket_entity.dart';
import 'package:my_shop/feature/domain/entities/order_entities/status_entity.dart';

class OrderEnt extends Equatable {
  OrderEnt({
     this.id,
     this.name,
     this.address,
     this.phone,
     this.email,
     this.basket,
     this.totalPrice,
     this.comment,
     this.status,
  });

  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final BasketEnt? basket;
  final int? totalPrice;
  final String? comment;
  final StatusEnt? status;

  @override
  List<Object?> get props =>
      [id, name, address, phone, email, basket, totalPrice, comment, status];
}
