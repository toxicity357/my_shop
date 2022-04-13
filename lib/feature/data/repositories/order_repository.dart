import 'dart:convert';

import 'package:my_shop/feature/data/data_sources/store.dart';
import 'package:my_shop/feature/data/mappers/order/order_mapper.dart';
import 'package:my_shop/feature/data/models/order/order_model.dart';
import 'package:my_shop/feature/domain/entities/order_entities/order_entities.dart';
import 'package:my_shop/feature/domain/repositories/order_repository.dart';
import 'package:http/http.dart' as http;

class CreateOrderRequestFailure implements Exception {}

class GetOrderRequestFailure implements Exception {}

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._orderMapper, this._store);

  final OrderMapper _orderMapper;
  final Store _store;
  static const _baseUrl = 'vue-study.skillbox.cc';

  @override
  Future<OrderEnt?>? createOrder(
      {required String? name,
      required String? address,
      required String? phone,
      required String? email,
      required String? comment}) async {
    final createOrderRequest = Uri.https(_baseUrl, '/api/orders',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final createOrderResponse = await http.post(createOrderRequest, body: {
      'name': '$name',
      'address': '$address',
      'phone': '$phone',
      'email': '$email',
      'comment': '$comment',
    });
    final _response =
        OrderModel.fromJson(json.decode(createOrderResponse.body));
    if (createOrderResponse.statusCode != 200) {
      throw CreateOrderRequestFailure();
    }
    final createOrder = _orderMapper.map(_response);
    return createOrder;
  }

  @override
  Future<OrderEnt?>? getOrderInfo({required String orderId}) async {
    final getOrderInfoRequest = Uri.https(_baseUrl, '/api/orders/$orderId',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final getOrderInfoResponse = await http.get(getOrderInfoRequest);
    final _response =
        OrderModel.fromJson(json.decode(getOrderInfoResponse.body));
    if (getOrderInfoResponse.statusCode != 200) {
      throw GetOrderRequestFailure();
    }
    final orderInfo = _orderMapper.map(_response);
    return orderInfo;
  }
}
