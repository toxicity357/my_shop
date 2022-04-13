// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemsModel _$ListItemsModelFromJson(Map<String, dynamic> json) =>
    ListItemsModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e == null ? null : ItemsModel.fromJson(e as Object))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(json['pagination'] as Object),
    );

Map<String, dynamic> _$ListItemsModelToJson(ListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };
