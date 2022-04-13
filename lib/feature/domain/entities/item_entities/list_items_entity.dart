import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';
import 'package:my_shop/feature/domain/entities/pagination.dart';

class ListItemsEnt extends Equatable {
  const ListItemsEnt({
    required this.items,
    required this.pagination,
  });

  final List<ItemsEnt> items;
  final Pagination? pagination;

  @override
  List<Object?> get props => [items, pagination];
}
