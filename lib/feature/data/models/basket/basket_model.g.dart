// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketModel _$BasketModelFromJson(Map<String, dynamic> json) => BasketModel(
      id: json['id'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : BasketProductModel.fromJson(e as Object))
          .toList(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Object),
    );

Map<String, dynamic> _$BasketModelToJson(BasketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'user': instance.user,
    };
