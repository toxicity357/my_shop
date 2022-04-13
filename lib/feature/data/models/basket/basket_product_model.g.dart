// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketProductModel _$BasketProductModelFromJson(Map<String, dynamic> json) =>
    BasketProductModel(
      id: json['id'] as int?,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      product: json['product'] == null
          ? null
          : ItemsModel.fromJson(json['product'] as Object),
    );

Map<String, dynamic> _$BasketProductModelToJson(BasketProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'product': instance.product,
    };
