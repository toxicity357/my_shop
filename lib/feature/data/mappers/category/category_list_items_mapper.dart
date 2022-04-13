import 'package:my_shop/feature/data/mappers/category/category_items_mapper.dart';
import 'package:my_shop/feature/data/models/category/category_list_items_model.dart';
import 'package:my_shop/feature/domain/entities/category_entities/category_list_items_entity.dart';

import '../mapper.dart';

class CategoryListItemsMapper
    extends Mapper<CategoryListItemsModel, CategoryListItemsEnt> {
  CategoryListItemsMapper({required this.categoryItemsMapper});

  final CategoryItemsMapper categoryItemsMapper;

  @override
  CategoryListItemsEnt? map(CategoryListItemsModel? entity) {
    return CategoryListItemsEnt(
      items: categoryItemsMapper.mapList(entity?.items),
    );
  }
}
