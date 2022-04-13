
import 'package:my_shop/feature/data/mappers/mapper.dart';
import 'package:my_shop/feature/data/mappers/user_login/user_mapper.dart';
import 'package:my_shop/feature/data/models/basket/basket_model.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/basket_entity.dart';

import 'basket_product_mapper.dart';


class BasketMapper extends Mapper<BasketModel, BasketEnt> {
  BasketMapper({required this.items, required this.usersMapper});

  final BasketProductMapper items;
  final UsersMapper usersMapper;


  @override
  BasketEnt? map(BasketModel? entity) {
    return BasketEnt(
      items: items.mapList(entity?.items),
      id: entity?.id ?? 0,
      user: usersMapper.map(entity?.user),
    );
  }
}