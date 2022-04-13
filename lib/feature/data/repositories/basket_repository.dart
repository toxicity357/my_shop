import 'dart:async';
import 'dart:convert';

import 'package:my_shop/feature/data/data_sources/store.dart';
import 'package:my_shop/feature/data/mappers/basket/basket_mapper.dart';
import 'package:my_shop/feature/data/models/basket/basket_model.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/basket_entity.dart';
import 'package:my_shop/feature/domain/repositories/basket_repository.dart';
import 'package:http/http.dart' as http;

class BasketRequestFailure implements Exception {}

class BasketRepositoryImpl implements BasketRepository {
  BasketRepositoryImpl(this._basketMapper, this._store);

  final BasketMapper _basketMapper;
  final Store _store;
  static const _baseUrl = 'vue-study.skillbox.cc';

  @override
  Future<bool>? addToBasket({required int productId}) async {
    final completer = Completer<bool>();
    final addRequest = Uri.https(_baseUrl, '/api/baskets/products',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final addResponse = await http
        .post(addRequest, body: {'productId': '$productId', 'quantity': '1'});
    if (addResponse.statusCode != 200) {
      throw BasketRequestFailure();
    }
    return completer.future;
  }

  @override
  Future<bool>? changeQuantity(
      {required int productId, required int quantity}) async {
    final completer = Completer<bool>();
    final changeRequest = Uri.https(_baseUrl, '/api/baskets/products',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final changeResponse = await http.put(changeRequest,
        body: {'productId': '$productId', 'quantity': '$quantity'});
    completer.complete(true);
    if (changeResponse.statusCode != 200) {
      throw BasketRequestFailure();
    }
    return completer.future;
  }

  @override
  Future<bool>? deleteFromBasket({required int? productId}) async {
    final completer = Completer<bool>();
    final deleteRequest = Uri.https(_baseUrl, '/api/baskets/products',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final deleteResponse =
        await http.delete(deleteRequest, body: {'productId': '$productId'});

    completer.complete(true);
    if (deleteResponse.statusCode != 200) {
      throw BasketRequestFailure();
    }
    return completer.future;
  }

  @override
  Future<BasketEnt?> getBasket() async {
    final basketRequest = Uri.https(_baseUrl, '/api/baskets',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final basketResponse = await http.get(basketRequest);
    final _response = BasketModel.fromJson(json.decode(basketResponse.body));
    if (basketResponse.statusCode != 200) {
      throw BasketRequestFailure();
    }
      final basket = _basketMapper.map(_response);
      return basket;
    }
  }

