import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_shop/feature/data/mappers/items/items_mapper.dart';
import 'package:my_shop/feature/data/models/items/items_model.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';
import 'package:my_shop/feature/domain/repositories/item_card_repository.dart';

class ItemsNotFoundFailure implements Exception {}

class ItemCardRepositoryImpl implements ItemCardRepository {
  ItemCardRepositoryImpl({required this.itemsMapper});

  final ItemsMapper itemsMapper;
  static const _baseUrl = 'vue-study.skillbox.cc';

  @override
  Future<ItemsEnt?> getProduct({required id}) async {
    final productRequest = Uri.https(_baseUrl, '/api/products/$id');

    final productResponse = await http.get(productRequest);

    final _response = ItemsModel.fromJson(json.decode(productResponse.body));
    if (productResponse.statusCode != 200) {
      throw ItemsNotFoundFailure;
    }
    final product = itemsMapper.map(_response);
    return product;
  }
}
