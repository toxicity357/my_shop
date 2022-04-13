// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListItemsModel _$CategoryListItemsModelFromJson(
        Map<String, dynamic> json) =>
    CategoryListItemsModel(
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              e == null ? null : CategoryItemsModel.fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$CategoryListItemsModelToJson(
        CategoryListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
