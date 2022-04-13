import 'package:my_shop/feature/data/mappers/items/items_mapper.dart';
import 'package:my_shop/feature/data/models/basket/basket_product_model.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/basket_product_entity.dart';

import '../mapper.dart';

class BasketProductMapper extends Mapper<BasketProductModel, BasketProductEnt> {
  BasketProductMapper({required this.itemsMapper});

  final ItemsMapper itemsMapper;

  @override
  BasketProductEnt? map(BasketProductModel? entity) {
    return BasketProductEnt(
      id: entity?.id ?? 0,
      quantity: entity?.quantity ?? 0,
      price: entity?.price ?? 0,
      item: itemsMapper.map(entity?.product),
    );
  }
}
