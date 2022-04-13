import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';

abstract class ItemCardRepository {
  Future<ItemsEnt?> getProduct({required int id});
}