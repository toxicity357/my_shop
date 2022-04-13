import 'package:my_shop/feature/data/mappers/items/colors_mapper.dart';
import 'package:my_shop/feature/data/mappers/mapper.dart';
import 'package:my_shop/feature/data/models/items/items_model.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';
import 'image_mapper.dart';

class ItemsMapper extends Mapper<ItemsModel, ItemsEnt>{
  ItemsMapper({required this.imageMapper, required this.colorsMapper});
  final ImageMapper imageMapper;
  final ColorsMapper colorsMapper;
  @override
ItemsEnt? map(ItemsModel? entity){

    return ItemsEnt(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        slug: entity?.slug ?? '',
        image: imageMapper.map(entity?.image),
        price: entity?.price ?? 0,
        colors: colorsMapper.mapList(entity?.colors),
    );
  }
}