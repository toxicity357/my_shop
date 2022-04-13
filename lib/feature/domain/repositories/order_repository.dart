import 'package:my_shop/feature/domain/entities/order_entities/order_entities.dart';

abstract class OrderRepository {
  Future<OrderEnt?>? createOrder(
      {required String? name,
      required String? address,
      required String? phone,
      required String? email,
      required String? comment});

  Future<OrderEnt?>? getOrderInfo({required String orderId});
}
