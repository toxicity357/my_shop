import 'package:my_shop/feature/data/mappers/basket/basket_mapper.dart';
import 'package:my_shop/feature/data/mappers/mapper.dart';
import 'package:my_shop/feature/data/mappers/order/status_mapper.dart';
import 'package:my_shop/feature/data/models/order/order_model.dart';
import 'package:my_shop/feature/domain/entities/order_entities/order_entities.dart';

class OrderMapper extends Mapper<OrderModel, OrderEnt> {
  OrderMapper({required this.statusMapper, required this.basketMapper});

  final StatusMapper statusMapper;
  final BasketMapper basketMapper;

  @override
  OrderEnt? map(OrderModel? entity) {
    return OrderEnt(
        id: entity?.id ?? 0,
        name: entity?.name ?? '',
        address: entity?.address ?? '',
        phone: entity?.phone ?? '',
        email: entity?.email ?? '',
        basket: basketMapper.map(entity?.basket),
        totalPrice: entity?.totalPrice ?? 0,
        comment: entity?.comment ?? '',
        status: statusMapper.map(entity?.status));
  }
}
