import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_shop/feature/data/mappers/category/category_list_items_mapper.dart';
import 'package:my_shop/feature/data/mappers/items/list_items_mapper.dart';
import 'package:my_shop/feature/data/models/category/category_list_items_model.dart';
import 'package:my_shop/feature/data/models/items/list_items_model.dart';
import 'package:my_shop/feature/domain/entities/category_entities/category_list_items_entity.dart';
import 'package:my_shop/feature/domain/entities/item_entities/list_items_entity.dart';
import 'package:my_shop/feature/domain/repositories/items_repository.dart';

class ItemsRequestFailure implements Exception {}

class ItemsNotFoundFailure implements Exception {}

class CategoryRequestFailure implements Exception {}

class ItemsRepositoryImpl implements ItemsRepository {
  ItemsRepositoryImpl(
      {required this.listItemsMapper, required this.categoryListItemsMapper});

  static const _baseUrl = 'vue-study.skillbox.cc';
  final ListItemsMapper listItemsMapper;
  final CategoryListItemsMapper categoryListItemsMapper;

  @override
  Future<ListItemsEnt?> getCatalog(
      {required offset, required categoryId}) async {
    final catalogRequest = Uri.https(
      _baseUrl,
      '/api/products',
      <String, String>{
        'categoryId': categoryId,
        'page': offset.toString(),
        'limit': 5.toString()
      },
    );
    final catalogResponse = await http.get(catalogRequest);
    final _response =
        ListItemsModel.fromJson(json.decode(catalogResponse.body));
    if (catalogResponse.statusCode != 200) {
      throw ItemsRequestFailure();
    }
    final listItems = listItemsMapper.map(_response);
    return listItems;
  }

  @override
  Future<CategoryListItemsEnt?> getCategory() async {
    final categoryRequest = Uri.https(_baseUrl, '/api/productCategories');
    final categoryResponse = await http.get(categoryRequest);
    final _response =
        CategoryListItemsModel.fromJson(json.decode(categoryResponse.body));
    if (categoryResponse.statusCode != 200) {
      throw CategoryRequestFailure();
    }
    final category = categoryListItemsMapper.map(_response);
    return category;
  }
}
