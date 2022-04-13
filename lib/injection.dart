import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/data/mappers/basket/basket_mapper.dart';
import 'package:my_shop/feature/data/mappers/category/category_items_mapper.dart';
import 'package:my_shop/feature/data/mappers/items/colors_mapper.dart';
import 'package:my_shop/feature/data/mappers/order/order_mapper.dart';
import 'package:my_shop/feature/data/mappers/user_login/user_mapper.dart';
import 'package:my_shop/feature/data/repositories/basket_repository.dart';
import 'package:my_shop/feature/data/repositories/item_card_repository.dart';
import 'package:my_shop/feature/data/repositories/items_repository.dart';
import 'package:my_shop/feature/data/repositories/order_repository.dart';
import 'package:my_shop/feature/data/repositories/user_repository.dart';
import 'package:my_shop/feature/domain/repositories/basket_repository.dart';
import 'package:my_shop/feature/domain/repositories/order_repository.dart';
import 'package:my_shop/feature/domain/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/data/data_sources/store.dart';
import 'feature/data/mappers/basket/basket_product_mapper.dart';
import 'feature/data/mappers/category/category_list_items_mapper.dart';
import 'feature/data/mappers/items/file_mapper.dart';
import 'feature/data/mappers/items/image_mapper.dart';
import 'feature/data/mappers/items/items_mapper.dart';
import 'feature/data/mappers/items/list_items_mapper.dart';
import 'feature/data/mappers/items/pagination_mapper.dart';
import 'feature/data/mappers/order/status_mapper.dart';
import 'feature/domain/repositories/item_card_repository.dart';
import 'feature/domain/repositories/items_repository.dart';

Future<Widget> injection(Widget app) async {
  final store = Store(await SharedPreferences.getInstance());
//Mappers
  final colorMapper = ColorsMapper();
  final fileMapper = FileMapper();
  final imageMapper = ImageMapper(fileMapper: fileMapper);
  final itemsMapper =
      ItemsMapper(imageMapper: imageMapper, colorsMapper: colorMapper);
  final paginationMapper = PaginationMapper();
  final listItemsMapper = ListItemsMapper(
      itemsMapper: itemsMapper, paginationMapper: paginationMapper);
  final usersMapper = UsersMapper();
  final basketProductMapper = BasketProductMapper(itemsMapper: itemsMapper);
  final basketMapper =
      BasketMapper(usersMapper: usersMapper, items: basketProductMapper);
  final statusMapper = StatusMapper();
  final orderMapper =
      OrderMapper(statusMapper: statusMapper, basketMapper: basketMapper);
  final categoryItemsMapper = CategoryItemsMapper();
  final categoryListItemsMapper =
      CategoryListItemsMapper(categoryItemsMapper: categoryItemsMapper);

//Repositories
  final itemCardRepositoryImpl =
      ItemCardRepositoryImpl(itemsMapper: itemsMapper);
  final itemsRepositoryImpl = ItemsRepositoryImpl(
      listItemsMapper: listItemsMapper,
      categoryListItemsMapper: categoryListItemsMapper);
  final basketRepositoryImpl = BasketRepositoryImpl(basketMapper, store);
  final userRepositoryImpl = UserRepositoryImpl(usersMapper, store);
  final orderRepositoryImpl = OrderRepositoryImpl(orderMapper, store);

  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<ItemsRepository>(create: (_) => itemsRepositoryImpl),
      RepositoryProvider<ItemCardRepository>(
          create: (_) => itemCardRepositoryImpl),
      RepositoryProvider<BasketRepository>(create: (_) => basketRepositoryImpl),
      RepositoryProvider<UserRepository>(create: (_) => userRepositoryImpl),
      RepositoryProvider<OrderRepository>(create: (_) => orderRepositoryImpl),
    ],
    child: app,
  );
}
