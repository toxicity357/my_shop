// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      basket: json['basket'] == null
          ? null
          : BasketModel.fromJson(json['basket'] as Object),
      totalPrice: json['totalPrice'] as int?,
      comment: json['comment'] as String?,
      status: json['status'] == null
          ? null
          : StatusModel.fromJson(json['status'] as Object),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'basket': instance.basket,
      'totalPrice': instance.totalPrice,
      'comment': instance.comment,
      'status': instance.status,
    };
