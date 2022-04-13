import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/basket_product_entity.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/user_entity.dart';


class BasketEnt extends Equatable{
  const BasketEnt(
      {required this.id, required this.items, required this.user});

  final int? id;
  final List<BasketProductEnt?> items;
  final UserEnt? user;

  @override

  List<Object?> get props => [id, items, user];
}