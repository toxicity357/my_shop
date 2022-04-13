import 'package:my_shop/feature/data/mappers/items/pagination_mapper.dart';
import 'package:my_shop/feature/data/models/items/list_items_model.dart';
import 'package:my_shop/feature/domain/entities/item_entities/list_items_entity.dart';
import '../mapper.dart';
import 'items_mapper.dart';

class ListItemsMapper extends Mapper<ListItemsModel, ListItemsEnt> {
  ListItemsMapper({required this.itemsMapper, required this.paginationMapper});

  final ItemsMapper itemsMapper;
  final PaginationMapper paginationMapper;

  @override
  ListItemsEnt? map(ListItemsModel? entity) {
    return ListItemsEnt(
        items: itemsMapper.mapList(entity?.items),
        pagination: paginationMapper.map(entity?.pagination));
  }
}
