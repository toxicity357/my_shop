
import 'package:my_shop/feature/domain/entities/category_entities/category_list_items_entity.dart';
import 'package:my_shop/feature/domain/entities/item_entities/list_items_entity.dart';

abstract class ItemsRepository {
  Future<ListItemsEnt?> getCatalog({required int offset, required String categoryId});

  Future<CategoryListItemsEnt?>? getCategory();
}
