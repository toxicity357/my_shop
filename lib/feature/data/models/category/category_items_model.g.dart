// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItemsModel _$CategoryItemsModelFromJson(Map<String, dynamic> json) =>
    CategoryItemsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$CategoryItemsModelToJson(CategoryItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
    };
