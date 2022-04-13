import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/category_entities/category_items_entity.dart';

class CategoryListItemsEnt extends Equatable{
  final List<CategoryItemsEnt?>? items;

  const CategoryListItemsEnt({
    required this.items,
  });

  @override

  List<Object?> get props => [items];
}