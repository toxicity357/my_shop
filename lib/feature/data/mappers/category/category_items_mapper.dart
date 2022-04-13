import 'package:my_shop/feature/data/models/category/category_items_model.dart';
import 'package:my_shop/feature/domain/entities/category_entities/category_items_entity.dart';

import '../mapper.dart';

class CategoryItemsMapper extends Mapper<CategoryItemsModel, CategoryItemsEnt> {
  @override
  CategoryItemsEnt? map(CategoryItemsModel? entity) {
    return CategoryItemsEnt(
      id: entity?.id ?? 0,
      title: entity?.title ?? '',
      slug: entity?.slug ?? '',
    );
  }

}