import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';

class BasketProductEnt extends Equatable {
  const BasketProductEnt({
    required this.id,
    required this.price,
    required this.quantity,
     this.item,
  });

  final int? id;
  final int? price;
  final int? quantity;
  final ItemsEnt? item;

  @override

  List<Object?> get props => [id, price, quantity, item];
}
